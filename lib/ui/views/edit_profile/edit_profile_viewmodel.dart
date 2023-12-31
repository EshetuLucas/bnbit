import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/mixins/auth_mixin.dart';
import 'package:bnbit_app/mixins/media_mixin.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/views/edit_profile/edit_profile_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

const String _deleteAccounBusyKey = 'Delete Acount';
const String kUploadingBusyKey = 'Uploading';

class EditProfileViewModel extends FormViewModel with AuthMixin, MediaMixin {
  final log = getLogger('EditProfileViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _firebaseAuth = locator<FirebaseAuthenticationService>();
  final _snacBarService = locator<CustomSnackbarService>();

  String get userFullName => user.first_name + ' ${user.last_name ?? ''}';

  String get userMainAuth => !isPhoneAuth ? user.email ?? '' : user.phone ?? '';

  String get profilePic {
    if (user.profile_picture != null) {
      final relativeUrl = user.profile_picture!.replaceAll('$baseUrl/', '');
      log.e(baseUrl + '/' + relativeUrl);

      return baseUrl + '/' + relativeUrl;
    }
    return user.first_name[0] + (user.last_name ?? ' ')[0];
  }

  UserModel get user => _userService.currentUser;

  String _nameValidationMessage = '';
  String get nameValidationMessage => _nameValidationMessage;

  String get firstName => _userService.currentUser.first_name;

  String get lastName => _userService.currentUser.last_name ?? '';
  String get userPhoneNumer =>
      isPhoneAuth ? user.email ?? '' : user.phone ?? '';

  bool _showValidationIfAny = false;
  bool get isPhoneAuth =>
      _firebaseAuth.currentUser!.providerData.first.providerId == 'phone';

  bool get canChangePassowrdAndEmail =>
      _firebaseAuth.currentUser!.providerData.first.providerId == 'password';

  bool get isUploading => busy(kUploadingBusyKey);

  bool get hasValidFirstName => !firstNameValue.isNullOrEmpty;
  bool get hasNoValidFirstName {
    if (_showValidationIfAny && firstNameValue.isNullOrEmpty) {
      _nameValidationMessage = 'First Name can\'t be empty';
      return true;
    }
    return false;
  }

  void onNext() async {
    setEmailValidation('');
    _showValidationIfAny = true;
    if (!phoneNumberValue.isNullOrEmpty && isPhoneAuth) {
      validateEmail(phoneNumberValue);
      if (emailValidation.isNotEmpty) return;
    }
    notifyListeners();
    if (!hasNoValidFirstName) {
      UserModel updatedUser = user.copyWith(
        first_name: firstNameValue!,
        last_name: lastNameValue,
        email: isPhoneAuth ? phoneNumberValue : user.email,
        phone: isPhoneAuth ? user.phone : phoneNumberValue,
      );

      try {
        setBusy(true);
        await _userService.updateUser(updatedUser);
        _navigationService.back();
      } catch (e) {
        log.e('Unable to update a user $e');
      } finally {
        setBusy(false);
      }
    }
  }

  Future<void> addProfilePic() async {
    try {
      await onAddImage();
      if (selectedFile == null) return;
      setBusyForObject(kUploadingBusyKey, true);
      List<String> savedBusiness = user.saved_business;

      await _userService.updateUser(
        user,
        image: selectedFile,
      );

      await _userService.updateUser(
        user.copyWith(
          saved_business: savedBusiness,
        ),
      );
      clearSelectedFile();
    } catch (e) {
      log.e('Unable to upload image: $e');
    } finally {
      setBusyForObject(kUploadingBusyKey, false);
    }
  }

  void onChangePassword() {
    _navigationService.navigateToChangePasswordView();
  }

  void onDeleteAccount() {
    _snacBarService.comingSoon();
    notifyListeners();
  }
}
