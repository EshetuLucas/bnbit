import 'package:bnbit_app/api/common/api_client.dart';
import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/category/category.dart';

String categoriesUrl = baseUrl + '/business/categories';

mixin GetApis {
  final log = getLogger('CategoryGetApis');
  ApiClient get apiClient => ApiClient();


  Future<List<Category>> getCategoreis() async {
    return await apiClient.getList<Category>(
      categoriesUrl,
    );
  }
}
