import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/services/authentication_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:stacked/stacked.dart';

mixin AuthMixin on BaseViewModel {
  final log = getLogger('AuthMixin');
  final _authService = locator<AuthenticationService>();
  final emailValidator = EmailValidator();

  String _passwordValidation = '';
  String get passwordValidation => _passwordValidation;
  String _confirmPasswordValidation = '';
  String get confirmPasswordValidation => _confirmPasswordValidation;
  String _emailValidation = '';
  String get emailValidation => _emailValidation;

  bool get isAppleSignInAvailable => _authService.isAppleSignInAvailable;
  bool isEmailValid(String? email) =>
      EmailValidator.validate((email ?? '').trim());

  void validatePassword(String? password,
      {bool isSignup = false,
      isChangePassword = false,
      String? confirmPassword}) {
    if (password.isNullOrEmpty || password!.length < 6) {
      setPasswordValidation('Password should be at least 6 characters');
      return;
    }
    if ((isSignup || isChangePassword) && password != confirmPassword) {
      setPasswordValidation('Please make sure your passwords match',
          isConfirmPassword: true);
    }
  }

  void validateEmail(String? email) {
    if (email.isNullOrEmpty) {
      setEmailValidation('Email can\'t be empty');
      return;
    }
    if (!isEmailValid(email)) {
      setEmailValidation('Please enter a valid email address');
    }
  }

  void setPasswordValidation(String value, {bool isConfirmPassword = false}) {
    if (isConfirmPassword) {
      _confirmPasswordValidation = value;
    } else {
      _passwordValidation = value;
      _emailValidation = '';
    }
    notifyListeners();
  }

  void setEmailValidation(String value) {
    _emailValidation = value;
    _passwordValidation = '';
    notifyListeners();
  }
}
