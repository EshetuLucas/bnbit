import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.dialogs.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/url_launcher_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/views/edit_profile/edit_profile_view.dart';
import 'package:bnbit_app/ui/views/landing/landing_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.logger.dart';

const List<String> _urls = [
  'https://bnbit.com/terms-of-service/',
  'https://bnbit.com/contact/',
  'https://bnbit.com/about/',
  'https://bnbit.com/privacy-policy/',
];

class AccountViewModel extends BaseViewModel {
  final log = getLogger('AccountViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _businessService = locator<BusinessService>();
  final _firebaseAuth = locator<FirebaseAuthenticationService>();
  final _landingViewModel = locator<LandingViewModel>();
  final _urlLauncherService = locator<UrlLauncherService>();
  final _dailogService = locator<DialogService>();

  UserModel get user => _userService.currentUser;
  String get userPhoneNumer =>
      !isPhoneAuth ? user.email ?? '' : user.phone_number ?? '';

  bool get isPhoneAuth =>
      _firebaseAuth.currentUser!.providerData.first.providerId == 'phone';
  String get userFullName => user.first_name! + ' ${user.last_name ?? ''}';

  String get profilePic {
    if (user.profile_picture != null) {
      final relativeUrl = user.profile_picture!.replaceAll('$baseUrl/', '');

      return baseUrl + '/' + relativeUrl;
    }
    return user.first_name![0] + (user.last_name ?? ' ')[0];
  }

  List<String> get accountOptions => [
        'Terms and Conditions',
        'Support',
        'About',
        'Policy',
        'Saved',
        'My business',
      ];

  void init() {
    //  _appLifecycleObserver.clearCallBack();
  }

  Future<void> onOptionTap(int index) async {
    log.i('index:$index');

    switch (index) {
      case 0:
        openLink(0);
        break;
      case 1:
        openLink(1);
        break;
      case 2:
        openLink(2);
        break;
      case 3:
        openLink(3);
        break;
      case 4:
        onMyBusinessestTap(isSavedBusines: true);
        break;
      case 5:
        onMyBusinessestTap();
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
    final result =
        await _dailogService.showCustomDialog(variant: DialogType.warning);

    if (result?.confirmed ?? false) {
      await _userService.logout();
      _landingViewModel.onDispose();
      await _navigationService.clearStackAndShow(Routes.loginView);
    }
  }

  void onMyBusinessesTap() => _navigationService.navigateToMyBusinessesView();

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

  void onEditProifle() async {
    await _navigationService.navigateToEditProfileView();
    notifyListeners();
  }

  void onAddYourBusiness() {
    _navigationService.navigateToCreateBusinessView();
  }

  void onMyBusinessestTap({bool isSavedBusines = false}) {
    _navigationService.navigateToMyBusinessesView(
        isSavedBusiness: isSavedBusines);
  }

  Future<void> openLink(int index) async {
    await _urlLauncherService.openLink(_urls[index]);
  }
}
