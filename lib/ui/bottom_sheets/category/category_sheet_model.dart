import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/category/category.dart';

import 'package:stacked/stacked.dart';

class CategorySheetModel extends BaseViewModel {
  final log = getLogger('CategorySheetModel');

  final List<Category> items;
  CategorySheetModel(this.items);
}
