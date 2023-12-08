import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/sub_category/sub_category.dart';
import 'package:stacked/stacked.dart';

class SubCategoriesSheetModel extends BaseViewModel {
  final log = getLogger('FilterTypeSheetModel');

  SubCategoriesSheetModel(this._selectedItems);

  final List<SubCategory> _selectedItems;

  List<SubCategory> get selectedItems => _selectedItems;

  bool isSelected(SubCategory value) => _selectedItems.contains(value);

  void onSelectItem(SubCategory item) {
    _selectedItems.contains(item)
        ? _selectedItems.remove(item)
        : _selectedItems.add(item);
    notifyListeners();
  }
}
