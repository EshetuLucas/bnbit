import 'package:bnbit_app/api/common/api_client.dart';
import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/data_model/category/category.dart';

String categoriesUrl = baseUrl + '/business/categories';

String uploadImageUrl = baseUrl + '/business/galleries';
String businessUrl = baseUrl + '/business/businesses';
String myBusinessesUrl = baseUrl + '/business/get-my-businesses';
String getBusinessesByIdUrl = baseUrl + '/business/get-businesses-by-id';

mixin GetApis {
  final log = getLogger('CategoryGetApis');
  ApiClient get apiClient => ApiClient();

  get fileName => null;

  Future<List<Category>> getCategoreis() async {
    return await apiClient.getList<Category>(
      categoriesUrl,
    );
  }

  Future<List<Business>> getBusinesses({
    double? lat,
    double? lng,
    int? radius,
    String? subCategory,
  }) async {
    String query = '?';
    if (lat != null && lng != null) {
      query = query + 'address=$lat,$lng&';
    }
    if (radius != null) {
      query = query + 'radius=$radius&';
    }
    if (subCategory != null) {
      query = query + 'subcategories=$subCategory';
    }

    return await apiClient.getList<Business>(
      businessUrl + query,
    );
  }

  Future<List<Address>> getAddresses(url) async {
    return await apiClient.getList<Address>(
      url,
    );
  }

  Future<List<Business>> getMyBusinesses() async {
    return await apiClient.getList<Business>(
      myBusinessesUrl,
    );
  }

  Future<Business> getBusinessById(String businessId) async {
    return await apiClient.get<Business>(
      businessUrl + "/$businessId",
    );
  }

  Future<List<Business>> getBusinessesById(List<String> businessesId) async {
    return await apiClient.getList<Business>(
      getBusinessesByIdUrl + "?ids=${businessesId.map((e) => '"$e"').toList()}",
    );
  }
}
