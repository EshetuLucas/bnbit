import 'package:bnbit_app/data_model/language/language_model.dart';
import 'package:bnbit_app/services/authentication_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/views/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
//import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'login_view.form.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';

const String _ssoLoginKey = 'ssoLognKey';

class LoginViewModel extends FormViewModel {
  final log = getLogger('LoginViewModel');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();

  bool get isEthiopia => _selectedCountry.name == 'Ethiopia';
  bool get isSSOLogin => busy(_ssoLoginKey);
  bool get isAppleSignInAvailable => _authService.isAppleSignInAvailable;
  bool get enableLoginButton => _phoneNumberValidationMessage.isEmpty;

  String? _apiValidationMessage;
  String? get apiValidationMessage => _apiValidationMessage;

  String _phoneNumberValidationMessage = '';
  String get phoneNumberValidationMessage => _phoneNumberValidationMessage;

  String _passwordValidationMessage = '';
  String get passwordValidationMessage => _passwordValidationMessage;

  void validatePhoneNumber() {
    if (phoneNumberValue.isNullOrEmpty) {
      _phoneNumberValidationMessage = "Phone number can't be empty";
      notifyListeners();
      return;
    }
  }

  Future<void> login() async {
    // if (!await _internetCheckerService.checkInternetConnection()) {
    //   notifyListeners();
    //   return;
    // }
    _apiValidationMessage = null;
    validatePhoneNumber();

    if (enableLoginButton) {
      try {
        setBusy(true);
        await Future.delayed(const Duration(seconds: 1));
        await _authService.loginWithPhone(
            codeAutoRetrievalTimeout: onTimeOut,
            phoneNumber: selectedCountry.dialCode + phoneNumberValue!.trim(),
            verificationFailed: onVerificationFailed,
            codeSent: onCodeSent);
        return;
      } catch (e) {
        log.e("Unable to login: $e");
        _apiValidationMessage = "Something went wrong. Try again";
        setBusy(false);
      }
    }
  }

  void onVerificationFailed(FirebaseAuthException error) {
    _apiValidationMessage = error.message;
    setBusy(false);
  }

  void onCodeSent(String? verificationId, int? forceResendingToken) {
    _navigationService.navigateToVerifyOtpView(
        phoneNumber: (selectedCountry.dialCode + phoneNumberValue!).trim());
    setBusy(false);
  }

  void onTimeOut(String verificationId) {
    _apiValidationMessage = 'Time out. Please try again!';

    setBusy(false);
  }

  Future<void> signInWithGoogle() async {
    try {
      setBusyForObject(_ssoLoginKey, true);
      await _authService.signInWithGoogle();
      navigateToNextView();
    } catch (e) {
      log.e('Unable to sign-in with google: $e');
    } finally {
      setBusyForObject(_ssoLoginKey, false);
    }
  }

  Future<void> useAppleAuthentication() async {
    log.i('useAppleAuthentication');
    setBusyForObject(_ssoLoginKey, true);
    try {
      setBusy(true);
      await _authService.signInWithApple(
          appleRedirectUri:
              'https://bnbit_app-cashbook.firebaseapp.com/__/auth/handler',
          appleClientId: 'com.bnbit_app.bnbit_appCashbook');

      navigateToNextView();
    } catch (e) {
      log.e('Unable to sign-in with google: $e');
    } finally {
      setBusyForObject(_ssoLoginKey, false);
    }
  }

  Future<void> onEmailSignIn() async {
    log.i('useAppleAuthentication');
    try {
      _navigationService.navigateToEmailSignInView();
    } catch (e) {
      log.e('Unable to sign-in with google: $e');
    } finally {
      setBusy(false);
    }
  }

  void navigateToNextView() {
    bool isUserActive = _userService.currentUser.is_active;
    if (!_userService.currentUser.is_active) {
      _navigationService.navigateToCreateProfileView();
      return;
    }
    if (isUserActive) {
      _navigationService.clearStackAndShowView(const HomeView());
    } else {
      _navigationService.navigateToCreateProfileView();
    }
  }

  Future<void> useFacebookAuthentication() async {}

  Future<void> onTandCs() async {
    // await _urlLauncherService
    //     .openApp('https://bnbit_app.com/privacy-policy.html');
  }

  void onChangeCountry() async {
    final result = await _bottomSheetService.showCustomSheet(
      title: 'Select County',
      variant: BottomSheetType.countryPicker,
    );
    if (result == null) return;
    _selectedCountry = result.data;
    notifyListeners();
  }

  Country _selectedCountry =
      Country(name: 'Ethiopia', code: 'ET', dialCode: '+251', flag: 'et.png');
  Country get selectedCountry => _selectedCountry;
}
