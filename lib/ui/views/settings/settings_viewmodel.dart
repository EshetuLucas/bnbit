import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  final log = getLogger('SettingsViewModel');
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  bool get isDistanceInMile => _sharedPreferencesService.isDistanceInMile;

  void onChangeDistanceSystem(bool value) {
    log.i('value:$value');
    _sharedPreferencesService.setDistanceSystem(value);
    notifyListeners();
  }
}
