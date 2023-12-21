import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:bnbit_app/services/authentication_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/views/landing/landing_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteAccountViewModel extends BaseViewModel {
  final log = getLogger('DeleteAccountViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _firebaseAuth = locator<FirebaseAuthenticationService>();
  final _snacBarService = locator<CustomSnackbarService>();
  final _landingViewModel = locator<LandingViewModel>();
  final _authService = locator<AuthenticationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  UserModel get currentUser => _userService.currentUser;

  Future<void> reAuthUser() async {
    try {
      String providerId =
          _firebaseAuth.currentUser!.providerData.first.providerId;
      switch (providerId) {
        case 'phone':
          await phoneLogin();
          break;
        case 'password':
          await emailLogin();
          break;
        case 'google.com':
          await signInWithGoogle();
          break;
        case 'apple.com':
          await useAppleAuthentication();
          break;
        default:
      }
    } catch (e) {
      log.e("Unable to login: $e");

      setBusy(false);
    }
  }

  Future<bool> verifyPassword(String password) async {
    bool verified = false;
    try {
      var result = await _firebaseAuth.validatePassword(password);
      if (result is bool) verified = result;
      if (result is FirebaseAuthenticationResult) {
        _snacBarService.showError(result.errorMessage);
        setBusy(false);
      }
    } catch (e) {
      log.e('$e');
    }

    return verified;
  }

  Future<void> emailLogin() async {
    final result = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.singleInput, title: "Password");

    if (result?.data == null) return;
    String password = result!.data;
    if (password.length < 6) {
      _snacBarService.showError('Incorrect Password');
      return;
    }
    setBusy(true);
    bool isPasswordValid = await verifyPassword(password);
    if (!isPasswordValid) return;
    try {
      await _authService.loginWithEmail(
        email: currentUser.email!,
        password: password,
      );
      await deleteAccount();
    } catch (e) {
      log.e('Something went wrong : $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> phoneLogin() async {
    try {
      setBusy(true);
      await Future.delayed(const Duration(seconds: 1));
      await _authService.loginWithPhone(
          codeAutoRetrievalTimeout: onTimeOut,
          phoneNumber: currentUser.phone_number!.trim(),
          verificationFailed: onVerificationFailed,
          codeSent: onCodeSent);
      return;
    } catch (e) {
      log.e("Unable to login: $e");
      _snacBarService.showError('Something went wrong. Try again"');
      setBusy(false);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      setBusy(true);
      await _authService.signInWithGoogle();
      deleteAccount();
    } catch (e) {
      log.e('Unable to sign-in with google: $e');
      _snacBarService.showError('Something went wrong. Try again"');
    } finally {
      setBusy(false);
    }
  }

  Future<void> useAppleAuthentication() async {
    log.i('useAppleAuthentication');
    try {
      setBusy(true);
      await _authService.signInWithApple(
          appleRedirectUri:
              'https://bnbit_app-cashbook.firebaseapp.com/__/auth/handler',
          appleClientId: 'com.bnbit_app.bnbit_appCashbook');

      deleteAccount();
    } catch (e) {
      log.e('Unable to sign-in with google: $e');
      _snacBarService.showError('Something went wrong. Try again"');
    } finally {
      setBusy(false);
    }
  }

  Future<void> deleteAccount() async {
    try {
      setBusy(true);
      await _userService.deleteAccount();
      _landingViewModel.onDispose();
      await _navigationService.clearStackAndShow(Routes.loginView);
    } catch (e) {
      log.e('Unable to delete user account $e');
      _snacBarService.showError('Something went wrong. Try again!');
    } finally {
      setBusy(false);
    }
    notifyListeners();
  }

  void onVerificationFailed(FirebaseAuthException error) {
    _snacBarService.showError('Unable to verify. Try again!');
    setBusy(false);
  }

  void onCodeSent(String? verificationId, int? forceResendingToken) async {
    final result = await _navigationService.navigateToVerifyOtpView(
      phoneNumber: currentUser.phone_number!,
      isNewUser: false,
    );

    if (result == null) {
      setBusy(false);
      return;
    }
    if (result) {
      await deleteAccount();
    }
  }

  void onTimeOut(String verificationId) {
    _snacBarService.showError('Time out. Please try again!');
    setBusy(false);
  }
}
