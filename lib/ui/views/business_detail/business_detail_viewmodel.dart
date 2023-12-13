import 'dart:async';
import 'dart:ui' as ui;

import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/data_model/time_range/time_range.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/url_launcher_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/utils/algorithm_helpers.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:bnbit_app/utils/day.dart';
import 'package:bnbit_app/utils/time.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BusinessDetailViewModel extends BaseViewModel {
  final log = getLogger('BusinessDetailViewModel');
  final _navigationService = locator<NavigationService>();
  final _businessService = locator<BusinessService>();
  final _urlLauncher = locator<UrlLauncherService>();
  final _userService = locator<UserService>();

  UserModel get user => _userService.currentUser;

  List<String> _savedBusinesses = [];

  Map<String, TimeRange?> todayOperatingHour = {};

  late BitmapDescriptor markerbitmap;
  late BitmapDescriptor nearbyMarkerbitmap;

  final Business business;
  BusinessDetailViewModel({required this.business});
  final Completer<GoogleMapController> _controller = Completer();

  LatLng currentLocation = const LatLng(
    9.003429960888363,
    38.814238038050576,
  );

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  int _selectedAddressIndex = 0;
  int get selectedAddressIndex => _selectedAddressIndex;

  bool get isSaved => _savedBusinesses.contains(business.id);

  bool _showAllOperatingHours = false;
  bool get showAllOperatingHours => _showAllOperatingHours;

  void onInit() {
    _savedBusinesses = [...user.saved_business];
    setTodayOperatingHour();
  }

  void onMoreIconTap() {
    _showAllOperatingHours = !_showAllOperatingHours;
    notifyListeners();
  }

  void setTodayOperatingHour() {
    String day = DayUtil.getDay(DateTime.now().weekday);
    if (business.opening_hours.isNotEmpty) {
      TimeRange? timeRange = TimeUtil.convertOperatingHoursToTimeRanges(
          business.opening_hours)[day];
      if (timeRange != null) {
        todayOperatingHour[day] = TimeUtil.convertOperatingHoursToTimeRanges(
            business.opening_hours)[day];
      }
    }
  }

  void setSelectedImageIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void onImageTap(String url) => _navigationService.navigateToShowFullImageView(
      imagePath: url, isFromFile: false);

  void onImageChage(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<Marker> getMarkers({
    List<LatLng> latlngs = const [],
    required LatLng currentLocation,
  }) {
    log.e(latlngs.toString());
    List<Marker> markers = [];

    for (var element in latlngs) {
      markers.add(
        Marker(
          markerId: MarkerId(element.toString()),
          draggable: true,
          position: element,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

    markers.add(
      Marker(
        markerId: const MarkerId('map'),
        draggable: true,
        position: currentLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );
    return markers;
  }

  Future<void> launchMapsUrl(double lat, double long) async {
    log.i('lat:$lat');
    try {
      final url =
          'https://www.google.com/maps/dir/?api=1&travelmode=driving&destination=$lat,$long';

      await _urlLauncher.openLink(url);
    } catch (e) {
      log.e('Unable to launch map : $e');
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> setUpBitMaps() async {
    markerbitmap = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(myLocationImage, 140));
    nearbyMarkerbitmap = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(businessLocationImage, 180));
  }

  double distance(Address address) {
    return calculateDistance(
      currentLocation.latitude,
      currentLocation.longitude,
      address.latitude,
      address.longitude,
    );
  }

  void onMapCreated(GoogleMapController controller) async {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }

    LatLng latlng = LatLng(
      business.addresses.last.latitude,
      business.addresses.last.longitude,
    );
    changeCamera(latlng, _controller);

    // updateCameraLocation(
    //     source: currentLocation,
    //     destination: LatLng(
    //       business.address!.latitude,
    //       business.address!.longitude,
    //     ),
    //     controller: _controller);
  }

  void onChangeAddres(Address address, index) {
    LatLng latlng = LatLng(
      address.latitude,
      address.longitude,
    );
    _selectedAddressIndex = index;
    notifyListeners();

    changeCamera(latlng, _controller);
  }

  void onClose() => _navigationService.back();

  void onSettingTap() {
    _businessService.setSelectedBusiness(business);
    _navigationService.navigateToCreateBusinessView();
  }

  Future<void> changeCamera(
    LatLng target,
    Completer<GoogleMapController> controller,
  ) async {
    final GoogleMapController mapController = await controller.future;
    // final GoogleMapController controller = await _controller.future;
    mapController.showMarkerInfoWindow(MarkerId(target.toString()));
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          // bearing: 60.8334901395799,
          target: target,
          tilt: 80.440717697143555,
          zoom: 13.8,
        ),
      ),
    );
    notifyListeners();
  }

  Future<void> onSave() async {
    if (isBusy) return;
    if (_savedBusinesses.contains(business.id)) {
      _savedBusinesses.remove(business.id);
    } else {
      _savedBusinesses.add(business.id);
    }
    notifyListeners();
    try {
      setBusy(true);
      await _userService
          .updateUser(user.copyWith(saved_business: _savedBusinesses));
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
    }

    notifyListeners();
  }
}





// Future<void> updateCameraLocation({
//   required LatLng source,
//   required LatLng destination,
//   required Completer<GoogleMapController> controller,
// }) async {
//   final GoogleMapController mapController = await controller.future;
//   LatLngBounds bounds;

//   if (source.latitude > destination.latitude &&
//       source.longitude > destination.longitude) {
//     bounds = LatLngBounds(southwest: destination, northeast: source);
//   } else if (source.longitude > destination.longitude) {
//     bounds = LatLngBounds(
//         southwest: LatLng(source.latitude, destination.longitude),
//         northeast: LatLng(destination.latitude, source.longitude));
//   } else if (source.latitude > destination.latitude) {
//     bounds = LatLngBounds(
//         southwest: LatLng(destination.latitude, source.longitude),
//         northeast: LatLng(source.latitude, destination.longitude));
//   } else {
//     bounds = LatLngBounds(southwest: source, northeast: destination);
//   }

//   CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 70);

//   return checkCameraLocation(cameraUpdate, mapController);
// }

// Future<void> checkCameraLocation(
//     CameraUpdate cameraUpdate, GoogleMapController mapController) async {
//   mapController.animateCamera(cameraUpdate);
//   LatLngBounds l1 = await mapController.getVisibleRegion();
//   LatLngBounds l2 = await mapController.getVisibleRegion();

//   if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
//     return checkCameraLocation(cameraUpdate, mapController);
//   }
// }
