import 'dart:convert';

import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RecentSearchesViewModel extends BaseViewModel {
  final log = getLogger('RecentSearchesViewModel');
  final _navigationService = locator<NavigationService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  bool get isAddressHistory => key == 'search_address_history';

  RecentSearchesViewModel({required this.searchHistory, required this.key}) {
    if (isAddressHistory) {
      getRecentAddresses();
    }
  }
  void getRecentAddresses() {
    _recentAddresses.clear();
    for (var element in searchHistory) {
      _recentAddresses.add(Address.fromJson(json.decode(element)));
    }
  }

  List<String> searchHistory;
  final String key;
  final List<Address> _recentAddresses = [];
  List<Address> get recentAddresses => _recentAddresses;

  void onRemoveHistory(String history) {
    //List<String> tempList = [...searchHistory];
    searchHistory.remove(history);
    _sharedPreferencesService.saveToDisk(key, searchHistory);

    if (isAddressHistory) {}
    notifyListeners();
  }

  void onRemoveAddressHistory(Address history) {
    final addressJson = json.encode(history.toJson());
    searchHistory.remove(addressJson);
    _recentAddresses.remove(history);
    _sharedPreferencesService.saveToDisk(
        'search_address_history', searchHistory);
    getRecentAddresses();

    notifyListeners();
  }

  void onHistoryTap(String history) {
    _navigationService.back(result: history);
  }
}
