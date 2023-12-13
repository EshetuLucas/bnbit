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
    String? city,
    String? sub_city,
    String? state,
    String? country,
    String? phone_number,
    String? description,
    String? label,
    String? search,
    String? business,
    String? line1,
    String? line2,
    String? name,
  }) async {
    String query = '?';
    if (lat != null && lng != null) {
      query = query + 'address=$lat,$lng&';
    }
    if (radius != null) {
      query = query + 'radius=$radius&';
    }
    if (subCategory != null) {
      query = query + 'subcategories=$subCategory&';
    }
    if (city != null) {
      query = query + 'city=$city&';
    }
    if (country != null) {
      query = query + 'country=$country&';
    }
    if (state != null) {
      query = query + 'state=$state&';
    }
    if (description != null) {
      query = query + 'description=$description&';
    }
    if (description != null) {
      query = query + 'description=$description&';
    }
    if (label != null) {
      query = query + 'label=$label&';
    }
    if (search != null) {
      query = query + 'search=$search&';
    }
    if (business != null) {
      query = query + 'business=$business&';
    }
    if (line1 != null) {
      query = query + 'line1=$line1&';
    }
    if (line2 != null) {
      query = query + 'line2=$line2&';
    }
    if (name != null) {
      query = query + 'name=$name';
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
