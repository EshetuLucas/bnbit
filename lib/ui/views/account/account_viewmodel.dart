import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.logger.dart';

class AccountViewModel extends BaseViewModel {
  final log = getLogger('AccountViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  //final _appLifecycleObserver = locator<AppLifecycleObserver>();

  UserModel get user => _userService.currentUser;
  String get phoneOrEmail => user.phone ?? user.email!;
  String get userFullName => user.first_name + ' ${user.last_name ?? ''}';

  String get profilePic =>
      user.profilePicUrl ?? user.first_name[0] + (user.last_name ?? ' ')[0];

  List<String> get accountOptions => [
        'Terms and Conditions',
        'Support',
        'About',
        'My business',
      ];

  void init() {
    //  _appLifecycleObserver.clearCallBack();
  }

  Future<void> onOptionTap(int index) async {
    log.i('index:$index');

    switch (index) {
      case 0:
        //onPreference();
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        // onLanguage();
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        //onAbout();
        break;
      case 8:
        await onLogout();
        break;
      default:
    }
  }

  // Future<void> onCamera() async {
  //   log.i('');
  //   await _navigationService.navigateTo(
  //     Routes.profileUploadView,
  //   );
  //   notifyListeners();
  // }

  // Future<void> onPreference() async {
  //   _navigationService.navigateTo(Routes.preferenceView);
  // }

  // Future<void> onAbout() async {
  //   _navigationService.navigateTo(Routes.aboutView);
  // }

  // Future onLanguage() async {
  //   await _dialogService.showCustomDialog(
  //     variant: DialogType.LANGUAGE,
  //   );
  // }

  Future<void> onLogout() async {
    await _userService.logout();
    await _navigationService.clearStackAndShow(Routes.loginView);
  }

  // void onSavedEvents() {
  //   _navigationService.navigateTo(Routes.settingView);
  // }

  // void onSignUp() {
  //   _navigationService.navigateTo(Routes.signUpView);
  // }

  // Future<void> onPersonalInfoTap() async {
  //   await _navigationService.navigateTo(Routes.personalInfoView);
  //   notifyListeners();
  // }

  void onEditProifle() {}
  void onAddYourBusiness() {
    _navigationService.navigateToCreateBusinessView();
  }
}
