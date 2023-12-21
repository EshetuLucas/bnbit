import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/location_service.dart';
import 'package:bnbit_app/services/shared_preferences_service.dart';

import 'package:bnbit_app/ui/views/search_view/search_view_view.form.dart';
import 'package:bnbit_app/utils/algorithm_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewViewModel extends FormViewModel with $SearchViewView {
  final log = getLogger('SearchViewViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _locationService = locator<LocationService>();
  final _businessService = locator<BusinessService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  bool _isAddressSearch = false;
  bool get isAddressSearch => _isAddressSearch;

  bool _isSearchForKeyWord = false;
  bool get isSearchForKeyWord => _isSearchForKeyWord;

  String _searchKey = '';
  String get searchKey => _searchKey;

  LocationData? get currentLocation => _locationService.currentLocation;
  String currentLocationName = 'Everywhere';

  List<String> get recentSearches =>
      _sharedPreferencesService.getList('search_history') ?? [];

  List<String> get recentVisitedBusinessesId =>
      _sharedPreferencesService.getList('recent_visited') ?? [];

  Address? _selectedAddress;

  List<Business> _recentVisitedBusinesses = [];
  List<Business> get recentVisitedBusinesses => _recentVisitedBusinesses;

  List<Business> _businesseses = [];
  final List<Business> _nearByBusinesseses = [];
  List<Business> get nearByBusinesseses {
    if (isBusy) {
      return fakeBusinesses;
    }
    List<Business> tempNearbyBusinesses = [];
    tempNearbyBusinesses =
        isBusy && isAddressSearch ? fakeBusinesses : _nearByBusinesseses;

    tempNearbyBusinesses.sort(((a, b) => a.distance!.compareTo(b.distance!)));

    return tempNearbyBusinesses;
  }

  void setAddressSearchValue(bool value) {
    _isAddressSearch = value;
    notifyListeners();
  }

  void setSearchForKeyWordValue(bool value) {
    _isSearchForKeyWord = value;
    notifyListeners();
  }

  Future<void> onSeeAll(TextEditingController controller) async {
    final result = await _navigationService.navigateToRecentSearchesView(
      recentSearches: recentSearches,
      nameKey: 'search_history',
      title: 'Search history',
    );
    notifyListeners();
    if (result == null) return;
    controller.text = result;
    notifyListeners();
    onRecentSearchTap(result);
  }

  void onChange(String value) {
    _searchKey = value;
    if (_searchKey.isNotEmpty) getBusinesses();
    setShowNoMatchFoundValue(false);
    notifyListeners();
  }

  void onSearchForTheKeyWord({String? value}) {
    String history = value ?? _searchKey;
    if (history.isEmpty) return;
    if (!recentSearches.contains(history)) {
      List<String> tempList = [history, ...recentSearches];

      _sharedPreferencesService.saveToDisk('search_history', tempList);
    }
    setSearchForKeyWordValue(true);
    setAddressSearchValue(true);
    setShowNoMatchFoundValue(true);
    setShowNoMatchFoundValue(false);
    getBusinesses();
  }

  void onRecentSearchTap(
    String recentSearchKeyword,
  ) {
    onChange(recentSearchKeyword);

    onSearchForTheKeyWord();
  }

  Future<void> getBusinesses({bool makeViewModelBusy = false}) async {
    try {
      setBusy(true);
      _businesseses.clear();
      _nearByBusinesseses.clear();

      _businesseses = await _businessService.searchBusinesses(
        // search: _searchKey,
        city: _selectedAddress?.city,
        state: _selectedAddress?.state,
        country: _selectedAddress?.country,
        line1: _selectedAddress?.line1,
        line2: _selectedAddress?.line2,
        category: _searchKey,
        subCategory: _searchKey,
        description: _searchKey,
        services: _searchKey,
        name: _searchKey,
      );
      getBusinessBasedOnUserLocation();
      if (_nearByBusinesseses.isNotEmpty) {}
    } catch (e) {
      // setBusinessError(true);
      log.e('Unable to fetch categories $e');
    } finally {
      setBusy(false);
      setAddressSearchValue(false);
    }
  }

  void getBusinessBasedOnUserLocation() {
    _nearByBusinesseses.clear();

    for (var business in _businesseses) {
      for (var address in business.addresses) {
        if (currentLocation == null) {
          log.d('current location is null');
          _nearByBusinesseses.add(
            business.copyWith(
              distance: -1,
              addressName: address.displayAddress,
            ),
          );
        } else {
          log.d('current location is not null');
          final distance = calculateDistance(
            currentLocation?.latitude ?? 0,
            currentLocation?.longitude ?? 0,
            address.latitude,
            address.longitude,
          );
          log.d('distance:$distance');

          if (!_nearByBusinesseses
              .map((e) => e.id)
              .toList()
              .contains(business.id)) {
            _nearByBusinesseses.add(
              business.copyWith(
                distance: distance,
                address: address,
                addressName: address.line2 ?? address.city,
              ),
            );
          }
        }
      }
    }
    notifyListeners();

    log.e(_nearByBusinesseses.length);
  }

  Future<void> setCurrentLocation() async {
    final result = await _locationService.getUserLocation();

    final address = await _locationService.getLocationDetail(
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!));
    currentLocationName =
        '${address.subLocality ?? ''}' ', ' '${address.adminArea ?? ''}';
    log.v('result:$result');
    notifyListeners();
  }

  void onAddressTap() async {
    final result = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.selectLocation);

    if (result?.data == null) return;
    final address = result!.data as Address;
    _selectedAddress = address;

    currentLocationName = _selectedAddress!.displayAddress;
    _searchKey = '';
    searchController.text = '';
    notifyListeners();
    setAddressSearchValue(true);
    getBusinesses();

    log.d('subCity:${address.sub_city}');
    log.d('city:${address.city}');
    log.d('country:${address.country}');
    log.d('state:${address.state}');
    log.d('line1:${address.line1}');
    log.d('line2:${address.line2}');
    log.d('area:${address.area}');
  }

  void onInit() {
    // setCurrentLocation();
    getRecentVisitedBusinesses();
  }

  void onBusinessTap(Business business) {
    _navigationService.navigateToBusinessDetailView(business: business);
    onSearchForTheKeyWord(value: _searchKey);
    if (!recentSearches.contains(business.id)) {
      List<String> temp = [business.id, ...recentVisitedBusinessesId];
      _sharedPreferencesService.saveToDisk('recent_visited', temp);
      getRecentVisitedBusinesses();
    }
  }

  void getRecentVisitedBusinesses() async {
    _recentVisitedBusinesses =
        await _businessService.getBusinessesById(recentVisitedBusinessesId);
    notifyListeners();
  }

  SearchType _selectedSearchType = SearchType.keyWord;
  SearchType get selectedSearchType => _selectedSearchType;
  bool _showNoMatchFound = false;
  bool get showNomatchFound => _showNoMatchFound;
  void setShowNoMatchFoundValue(bool value) {
    _showNoMatchFound = value;
    notifyListeners();
  }

  Map<SearchType, String> searchTypeMapping = {
    SearchType.address: 'By Address',
    SearchType.keyWord: 'By Keyword',
  };

  void onSearchTypeTap(SearchType searchType) {
    _selectedSearchType = searchType;
    notifyListeners();
  }

  void onRemoveHistory(String history) {
    List<String> tempList = [...recentSearches];
    tempList.remove(history);
    _sharedPreferencesService.saveToDisk('search_history', tempList);
    notifyListeners();
  }

  void onRemoveRecentPlaces(String id) {
    List<String> tempList = [...recentVisitedBusinessesId];
    tempList.remove(id);
    _sharedPreferencesService.saveToDisk('recent_visited', tempList);
    _recentVisitedBusinesses.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

enum SearchType {
  address,
  keyWord,
}
