import 'package:stacked/stacked.dart';

class SearchViewViewModel extends BaseViewModel {
  String _searchKey = '';
  String get searchKey => _searchKey;

  void onChange(String value) {
    _searchKey = value;
    notifyListeners();
  }
}
