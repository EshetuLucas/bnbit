import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/exceptions/api_exceptions.dart';
import 'package:bnbit_app/mixins/auth_mixin.dart';
import 'package:bnbit_app/services/authentication_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/views/email_sign_in/email_sign_in_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailSignInViewModel extends FormViewModel with AuthMixin {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _userService = locator<UserService>();

  bool _isCreateAccount = false;
  bool get isCreateAccount => _isCreateAccount;

  String _apiErrorMessage = '';
  String get apiErrorMessage => _apiErrorMessage;
  void setApiErrorMessage(String value) {
    _apiErrorMessage = value;
    notifyListeners();
  }

  void setCreateAccountValue() {
    _isCreateAccount = !_isCreateAccount;
    notifyListeners();
  }

  void onClose() => _navigationService.back();

  Future<void> loginWithEmail() async {
    setEmailValidation('');
    setApiErrorMessage('');
    setPasswordValidation('');
    setBusy(true);
    if (!hasValidInputs) {
      log.i('hasValidInputs:$hasValidInputs');
      setBusy(false);
      return;
    }

    try {
      if (_isCreateAccount) {
        await _userService.sendEmailVerificationCode(emailValue!);

        _navigationService.navigateToVerifyOtpView(
            phoneNumber: emailValue!, password: passwordValue!);
        return;
      }
      final result = await _authService.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

      if (result.hasError) {
        log.e(result.errorMessage);
        if (result.exceptionCode == 'wrong-password') {
          setPasswordValidation(
              'You seemed to have entered the wrong password');
        } else if (result.exceptionCode == 'too-many-requests') {
          setPasswordValidation(
            "Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later",
          );
        } else if (result.exceptionCode == 'user-not-found') {
          setPasswordValidation(
            "There is no user record corresponding to this email",
          );
        } else {
          setPasswordValidation(
            "Something went wrong. Try again!",
          );
        }

        return;
      }
      if (!_userService.currentUser.is_active) {
        await _navigationService.clearStackAndShow(Routes.createProfileView);
      } else {
        await _navigationService.clearStackAndShow(Routes.homeView);
      }
    } on BadRequestException {
      setApiErrorMessage('The email is already in use!');
    } catch (e) {
      setApiErrorMessage('Something went wrong. Try again!');
      setBusy(false);
      log.e('Unable to complete the request $e');
    } finally {
      setBusy(false);
    }
  }

  bool get hasValidInputs {
    validateEmail(emailValue);
    validatePassword(passwordValue);
    if (emailValidation.isNotEmpty || passwordValidation.isNotEmpty) {
      return false;
    }
    return true;
  }

  void onSignUp() {}

  void onForgotPassword() {
    _navigationService.navigateTo(Routes.forgotPasswordView);
    // _snacBarService.comingSoon();
    notifyListeners();
  }
}
