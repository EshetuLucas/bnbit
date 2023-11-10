import 'package:bnbit_app/services/authentication_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
//import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyOtpViewModel extends FormViewModel {
  final log = getLogger('LoginViewModel');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _userService = locator<UserService>();

  final String phoneNumber;

  String? _apiValidationMessage;
  String? get apiValidationMessage => _apiValidationMessage;

  VerifyOtpViewModel(this.phoneNumber);

  void onBack() {
    _navigationService.back();
    dispose();
  }

  Future<void> onResendOTP() async {
    _timeOut = false;
    _now = DateTime.now();
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));

      await _authService.loginWithPhone(
        codeAutoRetrievalTimeout: onTimeOut,
        phoneNumber: phoneNumber,
        verificationFailed: onVerificationFailed,
        codeSent: onCodeSent,
      );
    } catch (e) {
      log.e("Unable to login: $e");
    }
  }

  void onVerificationFailed(FirebaseAuthException error) {
    setBusy(false);
  }

  void onCodeSent(String? verificationId, int? forceResendingToken) {
    _navigationService.navigateToVerifyOtpView(phoneNumber: phoneNumber);
    setBusy(false);
  }

  void onTimeOut(String verificationId) {
    setBusy(false);
  }

  bool get enableNextButton => _verification.length == 6;
  bool _timeOut = false;
  bool get timeOut => _timeOut;

  DateTime _now = DateTime.now();

  DateTime get now => _now;

  String _verification = '';
  String verificationCode(int index) {
    String code = otpCode ?? _verification;

    if (code.length > index) {
      if (otpCode != null) {
        onNext();
      }
      return _verification[index];
    }
    if (otpCode != null) {}
    return '';
  }

  String? get otpCode => _authService.otpCode;
  String? get verificationId => _authService.verificationId;

  void onChange(String value) {
    _apiValidationMessage = null;
    _verification = value;
    notifyListeners();
  }

  Future<void> onNext() async {
    setBusy(true);
    try {
      await _authService.verifyOTP(otpCode ?? _verification);
      navigateToNextView();
    } catch (e) {
      log.e('Unable to verify otp $e');
    } finally {
      setBusy(false);
    }
  }

  void navigateToNextView() {
    bool isUserActive = _userService.currentUser.is_active;
    if (isUserActive) {
      _navigationService.navigateToHomeView();
    } else {
      _navigationService.navigateToCreateProfileView();
    }
  }

  bool isBlinking(int index) {
    if (_verification.length == 6) {
      return false;
    }

    if (_verification.isEmpty) {
      return index == 0;
    }
    if (index == 0) {
      if (_verification.isNotEmpty) {
        return false;
      }
    }
    return _verification.length == index;
  }

  void onEnTime() {
    _timeOut = true;
    rebuildUi();
  }

  Future<void> onResend() async {
    setBusy(true);
    try {
      await _authService.verifyOTP(_verification);
      log.d('Phone number verifyed');
    } catch (e) {
      log.e('Unable to verify otp $e');
    } finally {
      setBusy(false);
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
