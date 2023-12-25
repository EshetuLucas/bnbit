import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'input_field_sheet.form.dart';

class InputFieldSheetModel extends FormViewModel {
  final log = getLogger('InputFieldSheetModel');
  final _navigationService = locator<NavigationService>();

  bool _showErrorMessage = false;

  String _priceValidationMessage = '';
  String get priceValidationMessage => _priceValidationMessage;

  String _currencyValidationMessage = '';
  String get currencyValidationMessage => _currencyValidationMessage;

  String _serviceValidationMessage = '';
  String get serviceValidationMessage => _serviceValidationMessage;

  void setPriceValidation(String value) {
    _priceValidationMessage = value;
    notifyListeners();
  }

  void setServiceValidation(String value) {
    _serviceValidationMessage = value;
    notifyListeners();
  }

  void checkInputValidation() {
    if (inputValue.isNullOrEmpty) {
      _serviceValidationMessage = "Service can't be empty";
    }
    if (priceValue.isNullOrEmpty) {
      _priceValidationMessage = "Price can't be empty";
    }

    if (priceValue.isNullOrEmpty) {
      _currencyValidationMessage = "Currency can't be empty";
    }
    notifyListeners();
  }

  void onDone(Function(SheetResponse response)? completer) {
    _showErrorMessage = false;
    checkInputValidation();
    if (_serviceValidationMessage.isNotEmpty ||
        _priceValidationMessage.isNotEmpty) {
      return;
    }
    completer?.call(SheetResponse(
      data: BusinessServiceModel(
          service: inputValue!,
          price: double.parse(priceValue!),
          currency: currencyValue!),
    ));
  }
}
