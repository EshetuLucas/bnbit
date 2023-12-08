import 'package:stacked/stacked.dart';

class TimeSelectionSheetViewModel extends BaseViewModel {
  DateTime? _selectedTime = null;

  DateTime? get selectedTime => _selectedTime;

  void setTime(DateTime value) {
    _selectedTime = value;
  }
}
