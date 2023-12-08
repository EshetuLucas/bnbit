import 'package:bnbit_app/app/app.dialogs.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/exceptions/firestore_api_exception.dart';
import 'package:bnbit_app/mixins/auth_mixin.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/views/forgot_paswword/forgot_paswword_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends FormViewModel with AuthMixin {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();

  bool get hasValidInputs {
    validateEmail(emailValue);
    if (emailValidation.isNotEmpty) {
      setBusy(false);
      return false;
    }
    return true;
  }

  Future<void> onRestPasswordButtonTap() async {
    setBusy(true);
    if (!hasValidInputs) {
      return;
    }
    try {
      await _userService.resetPassword(emailValue!);
      await _dialogService.showCustomDialog(variant: DialogType.forgotPassword);
      _navigationService.clearStackAndShow(Routes.loginView);
    } on EmailNotFoundException {
      setEmailValidation('There is no user with that email.');
    } catch (e) {
      log.e('Unable to rest user password :$e');
    } finally {
      setBusy(false);
    }
  }

  void onBackToLoginTextTap() => _navigationService.back();
}
