import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/views/create_profile/create_profile_view.form.dart';
import 'package:bnbit_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateProfileViewModel extends FormViewModel {
  final log = getLogger('CreateProfileViewModel');
  // final _internetCheckerService = locator<InternetCheckerService>();
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  UserModel get user => _userService.currentUser;

  String _nameValidationMessage = '';
  String get nameValidationMessage => _nameValidationMessage;

  String get firstName => user.first_name;
  String get lastName => user.last_name ?? '';

  bool _showValidationIfAny = false;
  bool get hasValidFirstName => !firstNameValue.isNullOrEmpty;

  bool get hasNoValidFirstName {
    if (_showValidationIfAny && firstNameValue.isNullOrEmpty) {
      _nameValidationMessage = 'First Name can\'t be empty';
      return true;
    }
    return false;
  }

  void onNext(String? phoneNumber) async {
    //  if (!await _internetCheckerService.checkInternetConnection()) {
    //   notifyListeners();
    //   return;
    // }


    _showValidationIfAny = true;
    notifyListeners();

    if (!hasNoValidFirstName) {
      UserModel updatedUser = user.copyWith(
        first_name: firstNameValue!,
        last_name: lastNameValue,
        is_active: true,
        phone: phoneNumber,
      );

      try {
        setBusy(true);
        await _userService.updateUser(updatedUser);
        await _navigationService.clearStackAndShowView(const HomeView());
      } catch (e) {
        log.e('Unable to update a user $e');
      } finally {
        setBusy(false);
      }
    }
  }
}
