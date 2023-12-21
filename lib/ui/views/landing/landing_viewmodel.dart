// ignore_for_file: must_call_super

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/time_range/time_range.dart';
import 'package:bnbit_app/services/url_launcher_service.dart';
import 'package:bnbit_app/utils/day.dart';
import 'package:bnbit_app/utils/time.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/data_model/category/category.dart';
import 'package:bnbit_app/data_model/address/address.dart' as business_address;
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/location_service.dart';
import 'package:bnbit_app/utils/algorithm_helpers.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_geocoder/geocoder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:ui' as ui;
import '../../../data_model/sub_category/sub_category.dart';

const String _busyKeyForBusiness = 'businessBusykey';

class LandingViewModel extends BaseViewModel {
  final log = getLogger('LandingViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _businessService = locator<BusinessService>();
  final _navigationService = locator<NavigationService>();
  final _locationService = locator<LocationService>();
  final _urlLauncher = locator<UrlLauncherService>();

  late BitmapDescriptor markerbitmap;
  late BitmapDescriptor nearbyMarkerbitmap;

  CarouselController carouselController = CarouselController();
  Completer<GoogleMapController> _controller = Completer();

  // ignore:
  @override
  void dispose() {}

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  Category? _selectedCategory;
  Category get selectedCategory => _selectedCategory!;

  List<Category> _categories = [];
  List<Category> get categories => isBusy
      ? fakeCategories
      : _categories
          .where((element) => element.subcategories.isNotEmpty)
          .toList();

  List<Business> _businesseses = [];
  final List<Business> _nearByBusinesseses = [];
  List<Business> get nearByBusinesseses {
    List<Business> tempNearbyBusinesses = [];
    tempNearbyBusinesses =
        isFetchingBusinesses ? fakeBusinesses : _nearByBusinesseses;

    tempNearbyBusinesses.sort(((a, b) => a.distance!.compareTo(b.distance!)));

    return tempNearbyBusinesses;
  }

  void onMapCreated(GoogleMapController controller) {
    if (_controller.isCompleted) return;
    controller.setMapStyle(
        '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
    _controller.complete(controller);
  }

  void onLoadingMapCreated(GoogleMapController controller) {}

  List<SubCategory> get subCategories {
    if (isBusy) return fakeSubCategories;
    List<SubCategory> value = [...selectedCategory.subcategories];
    value.sort((a, b) => a.name.length.compareTo(b.name.length));
    return value;
  }

  bool _isMapView = false;
  bool get isMapView => _isMapView;

  bool isSelected(int index) => index == _selectedIndex;
  bool get isFetchingBusinesses => isBusy || busy(_busyKeyForBusiness);

  bool _hasCategoryError = false;
  bool get hasCategoryError => _hasCategoryError;

  bool _hasBusinessError = false;
  bool get hasBusinessError => _hasBusinessError;

  void setCategoryError(bool value) {
    _hasCategoryError = value;
  }

  void setBusinessError(bool value) {
    _hasBusinessError = value;
    notifyListeners();
  }

  LocationData? get currentLocation => _locationService.currentLocation;
  business_address.Address? _address;

  String? currentLocationName;

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

  Future<void> setCurrentLocation() async {
    await _locationService.getUserLocation();

    Address address = await _locationService.getLocationDetail(
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!));
    _address = business_address.Address(
      city: address.locality!,
      country: address.countryName!,
      latitude: currentLocation!.latitude!,
      longitude: currentLocation!.longitude!,
      state: address.adminArea,
      line1: address.subLocality,
      line2: address.addressLine,
      sub_city: address.subLocality,
      area: address.subAdminArea,
    );
    log.d('_address:$_address');
    setCurrentLocationName(value: _address?.displayLocationName ?? '');
    notifyListeners();
  }

  void setCurrentLocationName({String? value}) {
    currentLocationName = value ?? _address?.displayAddress ?? '';
    notifyListeners();
  }

  Future<void> init() async {
    onChangeView(value: false);

    if (_nearByBusinesseses.isNotEmpty) {
      await getBusinesses(loadAgain: false);
      return;
    }
    setBusy(true);
    setCategoryError(false);

    await setUpBitMaps();

    try {
      await setCurrentLocation();
      _categories = await _businessService.getCategoreis();
      _selectedCategory = _categories[0];
      setBusy(false);
      await getBusinesses();
    } catch (e) {
      setCategoryError(true);
      log.e('Unable to fetch categories $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> getBusinesses({
    bool loadAgain = true,
  }) async {
    if (loadAgain) {
      setBusinessError(false);
      setBusyForObject(_busyKeyForBusiness, true);
    }

    await Future.delayed(const Duration(milliseconds: 200));
    try {
      _businesseses = await _businessService.getBusinesses(
        lat: currentLocation?.latitude,
        lng: currentLocation?.longitude,
        subCategory: subCategories[_selectedIndex].id,
        sub_city: _address?.sub_city,
        city: _address?.city,
        state: _address?.area,
        country: _address?.country,
      );
      getBusinessBasedOnUserLocation();
      if (_nearByBusinesseses.isNotEmpty) {
        activeBusiness = nearByBusinesseses.last;
        setMarkerInfo();
        setBusyForObject(_busyKeyForBusiness, false);
      }
    } catch (e) {
      if (loadAgain) {
        setBusinessError(true);
      }
      log.e('Unable to fetch categories $e');
    } finally {
      setMapKey();
      setBusyForObject(_busyKeyForBusiness, false);
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
    if (_nearByBusinesseses.isNotEmpty) {
      activeBusiness = nearByBusinesseses.last;
    }
    log.e(_nearByBusinesseses.length);
  }

  void onSubCategoryTap(int index) async {
    if (busy(_busyKeyForBusiness)) return;
    _selectedIndex = index;
    _nearByBusinesseses.clear();
    _businesseses.clear();

    notifyListeners();
    await getBusinesses();
    notifyListeners();
  }

  Future<void> onChangeCategory() async {
    if (isFetchingBusinesses) return;
    _nearByBusinesseses.clear();
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.category,
      data: categories,
      description: selectedCategory.id,
    );

    if (result?.data == null) return;

    _selectedCategory = result!.data;
    _selectedIndex = 0;
    await getBusinesses();
    notifyListeners();
  }

  Future<void> setMarkerInfo() async {
    if (nearByBusinesseses.isEmpty) return;
    activeBusiness = nearByBusinesseses.first;
    if (activeBusiness != null && activeBusiness!.address != null) {
      _controller = Completer();
      notifyListeners();
      final GoogleMapController controller = await _controller.future;

      controller.showMarkerInfoWindow(MarkerId(activeBusiness?.id ?? 'title'));
      if (activeBusiness?.address != null) {
        changeCamera(
          LatLng(
            activeBusiness!.address!.latitude,
            activeBusiness!.address!.longitude,
          ),
        );
      }
    }
  }

  String _mapKey = '';
  String get mapKey => _mapKey;

  void setMapKey() async {
    _mapKey = DateTime.now().toString() + categories[_selectedIndex].id;
    log.e('Map key:$_mapKey');
    notifyListeners();
    await setMarkerInfo();
  }

  Future<void> onChangeView({bool? value}) async {
    _isMapView = value ?? !_isMapView;
    await setMarkerInfo();
    notifyListeners();
  }

  Future<void> changeCamera(LatLng target) async {
    log.i('camera move');
    if (isFetchingBusinesses || activeBusiness == null) return;

    final GoogleMapController controller = await _controller.future;
    controller.showMarkerInfoWindow(MarkerId(activeBusiness?.id ?? 'title'));
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 60.8334901395799,
          target: target,
          tilt: 80.440717697143555,
          zoom: 14,
        ),
      ),
    );
    notifyListeners();
  }

  Business? activeBusiness;
  void onChangeBusiness(Business business) {
    activeBusiness = business;
    notifyListeners();
    log.i("business:$business");
    //_selectedBusiness = business;
    LatLng location =
        LatLng(business.address!.latitude, business.address!.longitude);
    changeCamera(location);
    notifyListeners();
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

  void onBusinessTap(Business business) {
    if (isBusy || isFetchingBusinesses) return;
    _navigationService.navigateToBusinessDetailView(business: business);
  }

  void onDispose() {
    _nearByBusinesseses.clear();
    _businesseses.clear();
  }

  List<Marker> getMarkers({
    List<LatLng> latlngs = const [],
    required LatLng currentLocation,
  }) {
    List<Marker> markers = [];

    for (var element in _nearByBusinesseses) {
      LatLng position =
          LatLng(element.address!.latitude, element.address!.longitude);
      markers.add(
        Marker(
          onTap: () async {
            animateToPage(_nearByBusinesseses.indexOf(element));
            final GoogleMapController controller = await _controller.future;
            controller
                .showMarkerInfoWindow(MarkerId(activeBusiness?.id ?? 'title'));

            onChangeBusiness(element);
          },
          markerId: MarkerId(element.id),
          position: position,
          infoWindow: InfoWindow(
            title: activeBusiness?.name,
            onTap: () => onBusinessTap(element),
          ),
          icon: nearbyMarkerbitmap,
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

  String getTitle(String businessId) {
    return _nearByBusinesseses[_selectedIndex].name;
  }

  void animateToPage(int index) {
    carouselController.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.linear);
    notifyListeners();
  }

  Future<void> onLocationTap() async {
    final result = await _navigationService.navigateToAddressSearchesView();
    if (result != null) {
      _address = result;
      setCurrentLocationName();
      notifyListeners();
      getBusinesses();
    }
  }

  String getOperatingHour(Business business) {
    String endTime = '';
    DateTime now = DateTime.now();
    Map<String, TimeRange?> operatingHour = {};
    String day = DayUtil.getDay(DateTime.now().weekday);
    if (business.opening_hours.isNotEmpty) {
      TimeRange? timeRange = TimeUtil.convertOperatingHoursToTimeRanges(
          business.opening_hours)[day];
      if (timeRange != null) {
        operatingHour[day] = TimeUtil.convertOperatingHoursToTimeRanges(
            business.opening_hours)[day];
        DateTime tempEndTime = DateTime(
          now.year,
          now.month,
          now.day,
          business.opening_hours[day]!.endTime.hour,
          business.opening_hours[day]!.endTime.minute,
          0,
          0,
          0,
        );

        DateTime tempNow = DateTime(
          now.year,
          now.month,
          now.day,
          now.hour,
          now.minute,
          0,
          0,
          0,
        );

        if (tempNow.isBefore(tempEndTime)) {
          endTime = DateFormat.jm().format(
            business.opening_hours[day]!.endTime,
          );
        }
      }
    }
    return endTime;
  }
}
