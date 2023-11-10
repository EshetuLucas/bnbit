import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/ui/views/create_business/create_business_view.form.dart';
import 'package:stacked/stacked.dart';

class CreateBusinessViewModel extends FormViewModel {
  String _nameValidationMessage = '';
  String get nameValidationMessage => _nameValidationMessage;

  bool _showValidationIfAny = false;
  bool get hasValidName => _showValidationIfAny && !nameValue.isNullOrEmpty;

  bool get hasNoValidName {
    if (_showValidationIfAny && nameValue.isNullOrEmpty) {
      _nameValidationMessage = 'Business Name can\'t be empty';
      return true;
    }
    return false;
  }

  Future<void> onCreateBusiness() async {}
}
