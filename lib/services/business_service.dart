import 'package:bnbit_app/api/category/category_apis.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/category/category.dart';

class BusinessService {
  final log = getLogger('DogsService');
  final _categoryApis = locator<CategoryApis>();

  Future<List<Category>> getCategoreis() async {
    return await _categoryApis.getCategoreis();
  }
}
