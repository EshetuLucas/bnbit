import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.dialogs.dart';
//import 'package:bnbit_app/app/app.dialogs.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/mixins/auth_mixin.dart';
import 'package:bnbit_app/mixins/media_mixin.dart';
import 'package:bnbit_app/services/authentication_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/views/edit_profile/edit_profile_view.form.dart';
import 'package:bnbit_app/ui/views/landing/landing_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:bnbit_app/ui/views/landing/landing_viewmodel.dart';
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
  final _landingViewModel = locator<LandingViewModel>();
  final _dailogService = locator<DialogService>();
  final _authService = locator<AuthenticationService>();

  String get userFullName => user.first_name! + ' ${user.last_name ?? ''}';

  String get userMainAuth =>
      !isPhoneAuth ? user.email ?? '' : user.phone_number ?? '';

  String get profilePic {
    if (user.profile_picture != null) {
      final relativeUrl = user.profile_picture!.replaceAll('$baseUrl/', '');
      log.e(baseUrl + '/' + relativeUrl);

      return baseUrl + '/' + relativeUrl;
    }
    return user.first_name![0] + (user.last_name ?? ' ')[0];
  }

  UserModel get user => _userService.currentUser;

  String _nameValidationMessage = '';
  String get nameValidationMessage => _nameValidationMessage;

  String get firstName => _userService.currentUser.first_name!;

  String get lastName => _userService.currentUser.last_name ?? '';
  String get userPhoneNumer =>
      isPhoneAuth ? user.email ?? '' : user.phone_number ?? '';

  bool _showValidationIfAny = false;
  bool get isPhoneAuth =>
      _firebaseAuth.currentUser!.providerData.first.providerId == 'phone';

  bool get canChangePassowrdAndEmail =>
      _firebaseAuth.currentUser!.providerData.first.providerId == 'password';

  bool get isUploading => busy(kUploadingBusyKey);
  bool get isDeletingAccount => busy(_deleteAccounBusyKey);

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
        phone_number: isPhoneAuth ? user.phone_number : phoneNumberValue,
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

  void onDeleteAccount() async {
    _navigationService.navigateToDeleteAccountView();
    return;
    final result = await _dailogService.showCustomDialog(
        variant: DialogType.warning,
        mainButtonTitle: 'Cancel',
        secondaryButtonTitle: 'Delete',
        title: 'Delete Account',
        description:
            'Are you sure you want to delete your account?\nThis action will permanently delete your account.');

    if (result?.confirmed ?? false) {
      try {
        setBusyForObject(_deleteAccounBusyKey, true);

        await _userService.deleteAccount();
        _landingViewModel.onDispose();
        await _navigationService.clearStackAndShow(Routes.loginView);
      } catch (e) {
        log.e('Unable to delete user account $e');
        _snacBarService.showError('Something went wrong. Try again!');
      } finally {
        setBusyForObject(_deleteAccounBusyKey, false);
      }
    }

    // _snacBarService.comingSoon();
    notifyListeners();
  }

  Future<void> reAuthUser() async {
    try {
      String providerId =
          _firebaseAuth.currentUser!.providerData.first.providerId;
      switch (providerId) {
        case 'phone':
          setBusy(true);
          await Future.delayed(const Duration(seconds: 1));
          await _authService.loginWithPhone(
            codeAutoRetrievalTimeout: onTimeOut,
            phoneNumber: (phoneNumberValue ?? '').trim(),
            verificationFailed: onVerificationFailed,
            codeSent: onCodeSent,
          );

          break;
        case 'password':
          _navigationService.navigateToEmailSignInView();
          break;
        case 'google.com':

          //  AuthCredential credential = GoogleAuthProvider.getCredential(acct.getIdToken(), null);
          //  user.reauthenticate(credential).addOnCompleteListener(new OnCompleteListener<Void>() {
          //     @Override
          //     public void onComplete(@NonNull Task<Void> task) {
          //         if (task.isSuccessful()) {
          //             Log.d(TAG, "Reauthenticated.");
          //         }
          //     }
          //  });

          break;
        case 'apple.com':
          break;
        default:
      }
    } catch (e) {
      log.e("Unable to login: $e");

      setBusy(false);
    }
  }

  void onVerificationFailed(FirebaseAuthException error) {
    //  _apiValidationMessage = error.message;
    setBusy(false);
  }

  void onCodeSent(String? verificationId, int? forceResendingToken) {
    _navigationService.navigateToVerifyOtpView(phoneNumber: phoneNumberValue!);
    setBusy(false);
  }

  void onTimeOut(String verificationId) {
    //_apiValidationMessage = 'Time out. Please try again!';

    setBusy(false);
  }
}
