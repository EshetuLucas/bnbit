import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ServicesViewModel extends BaseViewModel {
  final log = getLogger('ServicesViewModel');
  final _navigationService = locator<NavigationService>();
  final _businessService = locator<BusinessService>();

  NewBusiness get newBusiness => _businessService.newBusiness;
  Business? get selectedBusiness => _businessService.selectedBusiness;

  late final List<String> _services =
      selectedBusiness!.services as List<String>;
  List<String> get services => _services;

  void onAddService(String value) {
    _services.add(value);
    notifyListeners();
  }

  
}
