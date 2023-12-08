import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BusinessLocationsViewModel extends BaseViewModel {
  final log = getLogger('BusinessLocationsViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _businessService = locator<BusinessService>();
  final _navigationService = locator<NavigationService>();
  final _snackService = locator<CustomSnackbarService>();

  String get mapKey => dotenv.env['MAP_KEY']!;

  NewBusiness get newBusiness => _businessService.newBusiness;
  BusinessLocationsViewModel() {
    _address = [...newBusiness.addressDetails];
  }

  Address get placeHolderAddress => Address(
        city: 'Select Location',
        country: 'Ethiopia',
        latitude: 0,
        longitude: 0,
      );

  List<Address> _address = [];
  List<Address> get address => _address;
  bool get hasAddress => _address.isNotEmpty;
  void onAddAddress(int index) async {
    log.i('index:$index');
    // if (index != 0)
    {
      for (var element in address) {
        if (element.phone_number == null) {
          _snackService
              .showWarning('Please add Phone Number for previous address');
          notifyListeners();
          return;
        }
      }
      // if (address[index - 1].phone_number == null) {
      //   _snackService
      //       .showWarning('Please add Phone Number for previous address');
      //   notifyListeners();
      //   return;
      // }
    }
    // Prediction? prediction = await PlacesAutocomplete.show(
    //   context: context,
    //   apiKey: mapKey,
    //   onError: (value) => {log.e(value)},
    //   mode: Mode.overlay, // Mode.overlay
    //   language: "en",
    //   logo: Container(
    //     height: 50,
    //     width: screenWidth(context),
    //     child: Text(
    //       'Enter location',
    //     ),
    //   ),
    //   components: [
    //     Component(Component.country, "in"),
    //   ],
    // );

    // return;

    final result = await _navigationService.navigateToSelectLocationView(
      businesses: [],
    );
    if (result == null) return;

    log.i('index:$index');

    if (index < _address.length) {
      final oldAddress = _address[index];
      _address[index] = result.copyWith(
          phone_number: oldAddress.phone_number, label: oldAddress.label);
    } else {
      _address.add(result);
    }

    notifyListeners();

    return;
    //   final result = await _bottomSheetService.showCustomSheet(
    //       variant: BottomSheetType.selectLocation);

    //   if (result?.data == null) return;
    //   if (index == null) {
    //     _address.add(result!.data);
    //   } else {
    //     _address[index] = result!.data;
    //   }
    //   notifyListeners();
    // }
  }

  void onAddOtherDetails(String title, int index) async {
    log.i('index:$index');
    final result = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.addressDetail, title: title);

    if (result?.data == null) return;

    _address[index] = title == 'Phone Number'
        ? _address[index].copyWith(phone_number: result!.data)
        : address[index].copyWith(label: result!.data);
    notifyListeners();
  }

  void onDone() {
    for (var element in address) {
      if (element.phone_number == null) {
        _snackService.showWarning('Please add Phone Number for all addresses');
        notifyListeners();
        return;
      }
    }

    log.i('address:$address');
    NewBusiness updatedBusiness = newBusiness.copyWith(addressDetails: address);
    _businessService.setNewBusiness(updatedBusiness);
    _navigationService.back();
  }

  void onRemove(int index) {
    String latlng = _address[index].latitude.toString() +
        _address[index].longitude.toString();
    log.i('latlng:$latlng');
    _address.removeAt(index);
    NewBusiness updatedBusiness = newBusiness.copyWith(addressDetails: address);
    _businessService.setNewBusiness(updatedBusiness);
    _businessService.setRemovedAddresses(latlng);
    notifyListeners();
  }
}
