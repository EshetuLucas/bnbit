import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _errorKey = 'errorKey';

class MyBusinessesViewModel extends BaseViewModel {
  final log = getLogger('MyBusinessesViewModel');
  final _navigationService = locator<NavigationService>();
  final _businessService = locator<BusinessService>();
  final _userService = locator<UserService>();

  bool get hasError => error(_errorKey);

  bool isSavedBuinsess = false;

  final List<Business> _myBusinesses = [];
  List<Business> get myBusinesses => isBusy ? fakeBusinesses : _myBusinesses;

  void onInit(bool isSavedBuinsess) {
    this.isSavedBuinsess = isSavedBuinsess;
    getMyBusinesses();
  }

  Future<void> getMyBusinesses() async {
    try {
      setErrorForObject(_errorKey, false);
      setBusy(true);

      if (isSavedBuinsess && _userService.currentUser.saved_business.isEmpty) {
        setBusy(false);
        return;
      }
      // if (isSavedBuinsess) {
      //   for (var element in _userService.currentUser.saved_business) {
      //     _myBusinesses.add((await _businessService.getBusinessById(element)));
      //   }
      //   setBusy(false);
      //   return;
      // }

      final result = isSavedBuinsess
          ? await _businessService
              .getBusinessesById(_userService.currentUser.saved_business)
          : await _businessService.getMyBusinesses();
      for (var business in result) {
        if (_myBusinesses
            .where((element) => element.id == business.id)
            .toList()
            .isEmpty) {
          _myBusinesses.add(business);
        }
      }
    } catch (e) {
      setErrorForObject(_errorKey, true);
      log.e('Unable to get user businesses: $e');
    } finally {
      setBusy(false);
    }
  }

  void onBusinessTap(Business business, int index) async {
    if (isSavedBuinsess) {
      await _navigationService.navigateToBusinessDetailView(business: business);
      _myBusinesses.removeWhere((element) =>
          !_userService.currentUser.saved_business.contains(element.id));
      notifyListeners();
      return;
    }
    _businessService.setSelectedBusiness(business);

    await _navigationService.navigateToUpdateCreateBusinessView();
    _myBusinesses[index] = _businessService.selectedBusiness!;
    notifyListeners();
  }

  void onAddBusiness() {
    _navigationService.navigateToUpdateCreateBusinessView();
  }
}
