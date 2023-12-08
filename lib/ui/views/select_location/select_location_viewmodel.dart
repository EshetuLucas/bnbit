import 'dart:async';

import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:location_geocoder/location_geocoder.dart' as geo;

class SelectLocationViewModel extends FormViewModel {
  final log = getLogger('SelectLocationViewModel');
  LatLng currentLatLng = const LatLng(9.003429960888363, 38.814238038050576);
  final _placesService = locator<PlacesService>();
  final _navigationService = locator<NavigationService>();
  final _businessService = locator<BusinessService>();
  final _locationService = locator<LocationService>();

  TextEditingController searchController;

  SelectLocationViewModel(this.searchController);

  LocationData? get currentLocation => _locationService.currentLocation;

  String? currentLocationName;

  NewBusiness get newBusiness => _businessService.newBusiness;

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
  final Completer<GoogleMapController> _controller = Completer();

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void onConfirm() {
    if (_address != null) {
      //final addresses = newBusiness.addressDetails;

      // NewBusiness updatedBusiness =
      //     newBusiness.copyWith(addressDetails: [_address!, ...addresses]);
      // _businessService.setNewBusiness(updatedBusiness);
      _navigationService.back(result: _address!);
    }
  }

  void onClose() => _navigationService.back();

  void onSuggestionSelected(Description? description) async {
    try {
      _description = description;
      final placeId = _description?.place_id ?? '';
      log.e('placeId:$placeId');

      final placeDetail = await _placesService.getPlaceDetails(placeId);

      log.e('placeDetail:$placeDetail');

      currentLatLng = LatLng(placeDetail.lat ?? 0, placeDetail.lng ?? 0);

      changeCamera();
      notifyListeners();
    } catch (e) {
      log.e('Unable to get place detail $e');
    }
  }

  void onChanged(String value) {
    _searchKey = value;
    notifyListeners();
  }

  Future<void> changeCamera() async {
    log.i('camera move');
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 60.8334901395799,
          target: LatLng(
            currentLatLng.latitude,
            currentLatLng.longitude,
          ),
          tilt: 80.440717697143555,
          zoom: 14,
        ),
      ),
    );
    notifyListeners();
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
      currentLocationName =
          '${address.adminArea ?? ''}' ' ,' '${address.countryName ?? ''}';
      _address = Address(
        city: address.adminArea!,
        country: address.countryName!,
        latitude: currentLocation!.latitude!,
        longitude: currentLocation!.longitude!,
        state: address.subAdminArea,
        line1: address.subLocality,
        line2: address.addressLine,
      );
      searchController.text = _address!.displayAddress;
      notifyListeners();
      log.v('_address:$_address');
    } catch (e) {
      log.e('Unable to get location');
    } finally {
      setBusy(false);
    }
  }

  Future<void> onPlaceTap(int index) async {
    log.i('index $index');
    _selectedPlace = _autoCompleteResults[index];
    log.i('selectedPlace:$_selectedPlace');
    await getPlaceDetails(_selectedPlace!);
    _searchKey = '';
    notifyListeners();
  }

  void clearSelectedPlaceDetail() {
    _address = null;
    notifyListeners();
  }

  void onInit() {
    _placesService.initialize(
      apiKey: mapKey,
    );
    setCurrentLocation();
  }

  Future<void> getPlaceDetails(PlacesAutoCompleteResult placesDetail) async {
    log.i('placesDetail: $placesDetail');
    setBusy(true);
    try {
      final placeInfo =
          await _placesService.getPlaceDetails(placesDetail.placeId ?? '');

      log.d(placesDetail);
      _address = Address(
        city: placeInfo.city ?? 'Unknown',
        country: placeInfo.city ?? 'Unknown',
        latitude: placeInfo.lat ?? 0,
        longitude: placeInfo.lng ?? 0,
        state: placeInfo.state,
        line1: placesDetail.mainText,
        line2: placesDetail.secondaryText,
      );

      currentLatLng = LatLng(_address?.latitude ?? 0, _address?.longitude ?? 0);

      await changeCamera();
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
      _address = null;
      try {
        final placesResults = await _placesService.getAutoComplete(_searchKey);
        // getAddresses(_searchKey);

        _autoCompleteResults = placesResults;
        notifyListeners();
      } catch (e) {
        log.e(e);
      }
    }
  }
}
