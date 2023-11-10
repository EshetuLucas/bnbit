import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  //final _firebaseMessaging = locator<PushNotificationService>();
  //final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<CustomSnackbarService>();
  //final _deviceInfoService = locator<DeviceInfoService>();

  void initFCM() {
    //_firebaseMessaging.initialize(_userService.currentUser.id);
  }

  bool get minimizHomeAddButton => false;

  DateTime? backButtonPressTime;
  Duration snackBarDuration = const Duration(seconds: 2);
  Future<void> handleWillPop() async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            now.difference(backButtonPressTime!) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      _snackBarService.showExitAppMessage('Double tap to exit the App');
      return;
    }
    _navigationService.back();
    //MoveToBackground.moveTaskToBack();
  }

  void onHomeIconTap() {
    // if (_booksViewModel.scrollController.positions.isEmpty) return;
    // _booksViewModel.scrollController.animateTo(1,
    //     duration: const Duration(milliseconds: 450), curve: Curves.easeIn);
  }

  Future<void> killAppConfirmation() async {
    // if (currentIndex != 0) {
    //   setIndex(0);
    // } else {
    //   restScrolling();
    //   if (isSearchOn || isFilterOn) {
    //     setSearchOnValue(value: false);
    //     onChange('');
    //     return;
    //   }
    // }
    handleWillPop();
  }
}
