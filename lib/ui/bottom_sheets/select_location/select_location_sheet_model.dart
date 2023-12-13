import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/services/location_service.dart';
//import 'package:bnbit_app/services/business_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:location_geocoder/location_geocoder.dart' as geo;

class SelectLocationSheetModel extends FormViewModel {
  final log = getLogger('SelectLocationSheetModel');
  final _placesService = locator<PlacesService>();
  final _locationService = locator<LocationService>();

  final Function(SheetResponse response)? completer;
  SelectLocationSheetModel(this.completer);

  String get mapKey => dotenv.env['MAP_KEY']!;

  List<PlacesAutoCompleteResult> _autoCompleteResults = [];

  List<PlacesAutoCompleteResult> get autoCompleteResults =>
      _autoCompleteResults;

  PlacesAutoCompleteResult? _selectedPlace;
  Address? _address;

  bool get hasAutoCompleteResults => _autoCompleteResults.isNotEmpty;
  String _searchKey = '';
  void onChange(String value) {
    _searchKey = value;
    _getAutoCompleteResults();
  }

  Future<void> onPlaceTap(int index) async {
    log.i('index $index');
    _selectedPlace = _autoCompleteResults[index];
    log.i('selectedPlace:$_selectedPlace');
    await getPlaceDetails(_selectedPlace!);
  }

  void clearSelectedPlaceDetail() {
    _address = null;
    notifyListeners();
  }

  void onInit() {
    _placesService.initialize(
      apiKey: mapKey,
    );
  }

  Future<void> getPlaceDetails(PlacesAutoCompleteResult placesDetail) async {
    log.i('placesDetail: $placesDetail');
    setBusy(true);
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

      completer?.call(
        SheetResponse(data: _address),
      );
    } catch (e) {
      log.e(e);

      // showErrorDialog(
      //   title: 'Something went wrong. Try again!',
      // );
    }

    setBusy(false);
  }

  Future<void> setCurrentLocation() async {
    _searchKey = '';
    setBusy(true);
    try {
      final currentLocation = await _locationService.getUserLocation();

      geo.Address address = await _locationService.getLocationDetail(
          LatLng(currentLocation!.latitude!, currentLocation.longitude!));
      _address = Address(
        city: address.locality!,
        country: address.countryName!,
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!,
        state: address.subAdminArea,
        line1: address.subLocality,
        line2: address.addressLine,
        sub_city: address.subLocality,
        area: address.subAdminArea,
      );
      completer?.call(
        SheetResponse(data: _address),
      );
      log.v('_address:$_address');
    } catch (e) {
      log.e('Unable to get location');
    } finally {
      setBusy(false);
    }
  }

  @override
  void setFormStatus() {
    _getAutoCompleteResults();
  }

  Future<void> _getAutoCompleteResults() async {
    if (_searchKey.isNotEmpty) {
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

  Future<List<Address>> getAddresses(String query, {String city = ""}) async {
    List<Address> addresses = [];

    var baseUrl = 'https://maps.googleapis.com/maps/api';
    String url = "";
    if (city.isNotEmpty) {
      url =
          '$baseUrl/place/autocomplete/json?input=$query,${city.toLowerCase().replaceAll(" ", "+")}&types=geocode&key=$mapKey&components=country:ET&sensor=false';
    } else {
      url =
          '$baseUrl/place/autocomplete/json?input=$query&types=geocode&key=$mapKey&components=country:ET&sensor=false';
    }

    log.v(url.toString(), "URL");

    // var response = await _businessService.getAddresses(url);

    // log.d(response.body, "Body");
    // if (response.statusCode == 200) {
    //   var decoded = jsonDecode(response.body);
    //   addresses = (decoded['predictions'] as List).map((e) {
    //     return Address.fromMap(e);
    //   }).toList();
    // }
    return addresses;
  }
}
