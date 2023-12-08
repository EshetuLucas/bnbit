import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:bnbit_app/ui/views/change_password/change_password_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePasswordViewModel extends FormViewModel {
  final log = getLogger('ChangePasswordViewModel');
  final _authenticationService = locator<FirebaseAuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _snackService = locator<CustomSnackbarService>();

  final dynamic changeSuccessViewArgument;
  ChangePasswordViewModel({this.changeSuccessViewArgument});

  void navigateBack() => _navigationService.back();

  bool get canSaveChanges =>
      formNotEmpty && currentPasswordValue != newPasswordValue;

  bool get formNotEmpty =>
      !newPasswordValue.isNullOrEmpty && !currentPasswordValue.isNullOrEmpty;

  Future<bool> verify() async {
    bool verified = false;
    try {
      var result =
          await _authenticationService.validatePassword(currentPasswordValue!);
      if (result is bool) verified = result;
      if (result is FirebaseAuthenticationResult) {
        setValidationMessage(result.errorMessage);
      }
    } catch (e) {
      log.e('$e');
    }

    return verified;
  }

  void saveChanges() async {
    setBusy(true);
    var verified = await verify();
    try {
      if (verified) {
        await _authenticationService.updatePassword(newPasswordValue!);

        _navigationService.navigateTo(Routes.changeSuccessView,
            arguments: const ChangeSuccessViewArguments(
              image: "assets/images/password_success.png",
              title: 'Success!',
              subtitle: 'Your password has been successfully changed',
            ));

        _snackService.showSuccess('Password changed successfully.');
      }
    } catch (e) {
      _snackService.showError('Unable to change passowrd. Try again!');
    }
    setBusy(false);
  }
}
