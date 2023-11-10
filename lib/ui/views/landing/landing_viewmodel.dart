import 'package:bnbit_app/api/category/category_apis.dart';
import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/category/category.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../data_model/sub_category/sub_category.dart';

class LandingViewModel extends BaseViewModel {
  final log = getLogger('LandingViewModel');
  final _bottomSheetService = locator<BottomSheetService>();

  final _categoryApis = locator<CategoryApis>();

  void init() async {
    _selectedCategory = fakeCategories[0];
    final value = await _categoryApis.getCategoreis();
    log.e(value);
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  Category? _selectedCategory;
  Category get selectedCategory => _selectedCategory!;

  List<Category> _categories = [];
  List<Category> get categories => fakeCategories;

  List<SubCategory> _subCategories = [];
  List<SubCategory> get subCategories => fakeSubCategories;

  bool isSelected(int index) => index == _selectedIndex;

  void onSubCategoryTap(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> onChangeCategory() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.category,
      data: categories,
      description: selectedCategory.id,
    );

    if (result?.data == null) return;

    _selectedCategory = result!.data;
    notifyListeners();
  }
}
