import 'dart:convert';

import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/location_service.dart';
import 'package:bnbit_app/services/shared_preferences_service.dart';
import 'package:bnbit_app/utils/algorithm_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:location_geocoder/location_geocoder.dart' as geo;

class AddressSearchesViewModel extends FormViewModel {
  final log = getLogger('RecentSearchesViewModel');
  LatLng currentLatLng = const LatLng(9.003429960888363, 38.814238038050576);
  final _placesService = locator<PlacesService>();
  final _navigationService = locator<NavigationService>();
  final _businessService = locator<BusinessService>();
  final _locationService = locator<LocationService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  List<String> get recentSearches =>
      _sharedPreferencesService.getList('search_address_history') ?? [];

  final List<Address> _recentAddresses = [];
  List<Address> get recentAddresses => _recentAddresses;

  int _selectedIndex = 0;
  bool isSelectedIndex(int index) => _selectedIndex == index;

  TextEditingController searchController;

  AddressSearchesViewModel(this.searchController);

  LocationData? get currentLocation => _locationService.currentLocation;

  String? get currentLocationName =>
      _address == null ? '' : _address!.displayAddress;

  String get mapKey => dotenv.env['MAP_KEY']!;

  List<PlacesAutoCompleteResult> _autoCompleteResults = [];

  List<PlacesAutoCompleteResult> get autoCompleteResults =>
      _autoCompleteResults;

  PlacesAutoCompleteResult? _selectedPlace;

  bool get showList => _searchKey.isNotEmpty;
  bool get hasSelectedAddress => _selectedPlace != null;
  Address? _address;

  String _searchKey = '';
  String get searchKey => _searchKey;

  bool get hasAddress => _address != null;

  Description? _description;

  List<Business> _businesseses = [];

  final List<Business> _nearByBusinesseses = [];
  List<Business> get nearByBusinesseses {
    List<Business> tempNearbyBusinesses = [];
    tempNearbyBusinesses = isBusy ? fakeBusinesses : _nearByBusinesseses;

    tempNearbyBusinesses.sort(((a, b) => a.distance!.compareTo(b.distance!)));

    return tempNearbyBusinesses;
  }

  void onClose() => _navigationService.back();
  void getRecentAddresses() {
    _recentAddresses.clear();
    for (var element in recentSearches) {
      _recentAddresses.add(Address.fromJson(json.decode(element)));
    }
  }

  void onRecentSearchTap(int index) {
    _address = _recentAddresses[index];
    _searchKey = '';
    searchController.text = _address!.displayAddress;
    getBusinesses();
    notifyListeners();
  }

  void onBusinessTap(Business business) =>
      _navigationService.navigateToBusinessDetailView(business: business);

  void onSuggestionSelected(Description? description) async {
    try {
      setBusy(true);
      _description = description;
      final placeId = _description?.place_id ?? '';
      final placeDetail = await _placesService.getPlaceDetails(placeId);
      currentLatLng = LatLng(placeDetail.lat ?? 0, placeDetail.lng ?? 0);
      notifyListeners();
    } catch (e) {
      log.e('Unable to get place detail $e');
    } finally {
      setBusy(false);
    }
  }

  void onChanged(String value) {
    _searchKey = value;
    notifyListeners();
  }

  Future<void> onSeeAll() async {
    final result = await _navigationService.navigateToRecentSearchesView(
      recentSearches: recentSearches,
      nameKey: 'search_address_history',
      title: 'Location Search history',
    );
    notifyListeners();
    getRecentAddresses();
    if (result == null) return;

    int index = _recentAddresses.indexOf(Address.fromJson(json.decode(result)));

    // onRecentSearchTap(result);
    // controller.text = result;
    // notifyListeners();
    onRecentSearchTap(index);
  }

  Future<void> getBusinesses({bool makeViewModelBusy = false}) async {
    _navigationService.back(result: _address);
    return;
    try {
      setBusy(true);
      getRecentAddresses();

      _businesseses = await _businessService.getBusinesses(
        //  search: _searchKey,
        city: _address?.city,
        state: _address?.state,
        country: _address?.country,
        line1: _address?.line1,
        line2: _address?.line2,

        // description: _searchKey,
        // business: _searchKey,
        //   name: _searchKey,
      );
      getBusinessBasedOnUserLocation();
      if (_nearByBusinesseses.isNotEmpty) {}
    } catch (e) {
      // setBusinessError(true);

      log.e('Unable to fetch categories $e');
    } finally {
      setBusy(false);
      //setAddressSearchValue(false);
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

  bool get hasAutoCompleteResults => _autoCompleteResults.isNotEmpty;
  //String _searchKey = '';
  void onChange(String value) {
    _searchKey = value;
    _getAutoCompleteResults();
  }

  Future<void> setCurrentLocation() async {
    _searchKey = '';
    setBusy(true);
    try {
      await _locationService.getUserLocation();

      geo.Address address = await _locationService.getLocationDetail(
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!));
      // currentLocationName =
      //     '${address.adminArea ?? ''}' ' ,' '${address.countryName ?? ''}';
      _address = Address(
        city: address.locality!,
        country: address.countryName!,
        latitude: currentLocation!.latitude!,
        longitude: currentLocation!.longitude!,
        state: address.subAdminArea,
        line1: address.subLocality,
        line2: address.addressLine,
        sub_city: address.subLocality,
        area: address.subAdminArea,
      );
      _searchKey = '';
      searchController.text = _address!.displayAddress;
      updateSearchHistory();
      getBusinesses();
      notifyListeners();
      log.v('_address:$_address');
    } catch (e) {
      log.e('Unable to get location');
    } finally {
      setBusy(false);
    }
  }

  Future<void> onPlaceTap(int index) async {
    if (isBusy) return;
    try {
      _selectedIndex = index;
      setBusy(true);
      log.i('index $index');
      _selectedPlace = _autoCompleteResults[index];
      log.i('selectedPlace:$_selectedPlace');
      await getPlaceDetails(_selectedPlace!);
      updateSearchHistory();
      _searchKey = '';
      getBusinesses();
      notifyListeners();
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
    }
  }

  void clearSelectedPlaceDetail() {
    _address = null;
    notifyListeners();
  }

  void onInit() {
    _placesService.initialize(
      apiKey: mapKey,
    );
    getRecentAddresses();
  }

  Future<void> getPlaceDetails(PlacesAutoCompleteResult placesDetail) async {
    log.i('placesDetail: $placesDetail');

    try {
      final placeInfo =
          await _placesService.getPlaceDetails(placesDetail.placeId ?? '');
      final detail = await _locationService.getLocationDetail(LatLng(
        placeInfo.lat ?? 0,
        placeInfo.lng ?? 0,
      ));

      _address = Address(
        city: detail.locality ?? 'Unknown',
        country: detail.countryName ?? 'Unknown',
        latitude: placeInfo.lat ?? 0,
        longitude: placeInfo.lng ?? 0,
        state: placeInfo.state,
        line1: placesDetail.mainText,
        line2: placesDetail.secondaryText,
        area: detail.locality,
        sub_city: detail.subLocality,
      );

      _searchKey = '';
      notifyListeners();

      currentLatLng = LatLng(_address?.latitude ?? 0, _address?.longitude ?? 0);
    } catch (e) {
      log.e(e);

      // showErrorDialog(
      //   title: 'Something went wrong. Try again!',
      // );
    }

    setBusy(false);
  }

  @override
  void setFormStatus() {
    _getAutoCompleteResults();
  }

  Future<void> _getAutoCompleteResults() async {
    if (_searchKey.isNotEmpty) {
      try {
        final placesResults = await _placesService.getAutoComplete(_searchKey);

        _autoCompleteResults = placesResults;
        notifyListeners();
      } catch (e) {
        log.e(e);
      }
    }
  }

  void updateSearchHistory() {
    final addressJson = json.encode(_address!.toJson());
    if (!recentSearches.contains(addressJson)) {
      List<String> temp = [addressJson, ...recentSearches];
      _sharedPreferencesService.saveToDisk('search_address_history', temp);
    }
  }

  void onRemoveHistory(Address history) {
    final addressJson = json.encode(history.toJson());
    List<String> tempList = [...recentSearches];
    tempList.remove(addressJson);
    _recentAddresses.remove(history);
    _sharedPreferencesService.saveToDisk('search_address_history', tempList);

    notifyListeners();
  }
}
