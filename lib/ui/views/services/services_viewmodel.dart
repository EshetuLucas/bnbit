import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ServicesViewModel extends BaseViewModel {
  final log = getLogger('ServicesViewModel');
  final _navigationService = locator<NavigationService>();
  final _businessService = locator<BusinessService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _snackService = locator<CustomSnackbarService>();

  bool get hasServices => _services.isNotEmpty;

  NewBusiness get newBusiness => _businessService.newBusiness;
  Business? get selectedBusiness => _businessService.selectedBusiness;

  late final List<BusinessServiceModel> _services = [...newBusiness.services];
  List<BusinessServiceModel> get services => _services;

  void onAddService(int index) async {
    final result = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.inputField, title: 'Service');
    if (result?.data == null) return;
    if (index < _services.length) {
      _services[index] = result!.data;
    } else {
      _services.add(result!.data);
    }

    notifyListeners();
  }

  void onRemove(int index) {
    _services.removeAt(index);
    NewBusiness updatedBusiness = newBusiness.copyWith(services: _services);
    _businessService.setNewBusiness(updatedBusiness);
    notifyListeners();
  }

  void onDone() {
    log.i('_services:$_services');
    NewBusiness updatedBusiness = newBusiness.copyWith(services: _services);
    _businessService.setNewBusiness(updatedBusiness);
    _navigationService.back();
  }
}
