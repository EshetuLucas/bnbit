import 'dart:math';

import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/services/shared_preferences_service.dart';

double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lng2 - lng1) * p)) / 2;
  return (12742 * asin(sqrt(a)));
}

String getFormattedDistance(double distance) {
  bool isDistanceInMile = locator<SharedPreferencesService>().isDistanceInMile;
  if (!isDistanceInMile) {
    if (distance < 1) {
      return (distance * 1000).toStringAsFixed(2).toString().split('.').first +
          ' m';
    }
    return distance.roundToDouble().toString().replaceAll('-', '') + ' km';
  } else {
    double inMiles = distance * 0.621371;

    return inMiles.toStringAsFixed(2).toString().replaceAll('-', '') + ' mi';
  }
}
