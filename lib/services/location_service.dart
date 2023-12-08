import 'package:bnbit_app/app/app.dialogs.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_geocoder/location_geocoder.dart' as geo;
import 'package:stacked_services/stacked_services.dart';
import 'package:location/location.dart';

class LocationService {
  final log = getLogger('LocationService');
  Location location = Location();
  final _dialogService = locator<DialogService>();

  LocationData? _currentLocation;
  LocationData? get currentLocation => _currentLocation;

  Future<LocationData?> getLocation() async {
    log.i('');
    bool _serviceEnabled = await location.serviceEnabled();
    log.v(_serviceEnabled);
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        await _dialogService.showCustomDialog(
            variant: DialogType.location, title: "Please trun location on");
      }
    } else {
      log.v('location is enabled');
      PermissionStatus permissionGranted = await location.hasPermission();
      log.v('$permissionGranted');
      if (permissionGranted == PermissionStatus.denied) {
        log.v('Permission denied');
        permissionGranted = await location.requestPermission();
      } else if (permissionGranted == PermissionStatus.granted) {
        log.v('Permission granted');
        try {
          log.v("getting current location");
          final result = await location.getLocation();
          log.v("result:$result");
          return result;
        } catch (e) {
          log.e('Unable to get location: $e');
          rethrow;
        }
      }
    }
  }

  Future<LocationData?> getUserLocation() async {
    _currentLocation = //await getLocation();
        //??
        LocationData.fromMap({
      'latitude': 9.003429960888363,
      'longitude': 38.814238038050576,
    });

    return currentLocation;
  }

  Future<geo.Address> getLocationDetail(LatLng lng) async {
    log.v('latlng:$lng');
    String mapKey = dotenv.env['MAP_KEY']!;

    final geo.LocatitonGeocoder geocoder = geo.LocatitonGeocoder(mapKey);
    final address = await geocoder.findAddressesFromCoordinates(
        geo.Coordinates(lng.latitude, lng.longitude));
    log.e('address:${address.first.featureName}');

    return address.first;
  }
}
