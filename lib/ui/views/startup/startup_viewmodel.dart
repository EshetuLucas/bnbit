import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/services/authentication_service.dart';
import 'package:bnbit_app/services/location_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewViewModel');
  final _firebaseAuthentication = locator<FirebaseAuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _userService = locator<UserService>();
  final _locationService = locator<LocationService>();

  // Place anything here that needs to happen before we get into the application

  Future<void> startupLogic() async {
    try {
      _locationService.getUserLocation();
      if (_firebaseAuthentication.hasUser) {
        log.v('Has user: ${_firebaseAuthentication.hasUser}');
        await _authService.syncUserAccount();
        if (!_userService.currentUser.is_active) {
          await _navigationService.clearStackAndShow(Routes.createProfileView);
          return;
        }

        await _navigationService.clearStackAndShow(Routes.homeView);
      } else {
        await _navigationService.clearStackAndShow(Routes.loginView);
      }
    } catch (e) {
      log.e('Unable to syncUser:$e');
      await _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}
