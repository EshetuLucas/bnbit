import 'dart:io';

import 'package:bnbit_app/api/common/api_client.dart';
import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:dio/dio.dart';

String categoriesUrl = baseUrl + '/business/categories';
String uploadImageUrl = baseUrl + '/business/galleries';
String businessUrl = baseUrl + '/business/businesses';
String addAddressesUrl = baseUrl + '/business/addresses';

mixin PostApis {
  final log = getLogger('CategoryGetApis');
  ApiClient get apiClient => ApiClient();

  Future<Image> uploadImage({
    required String business,
    required File image,
  }) async {
    var formData = FormData.fromMap({
      "business": business,
      'image': await MultipartFile.fromFile(image.path)
    });
    return await apiClient.post<Image>(
      uploadImageUrl,
      formData,
    );
  }

  Future<Business> createBuisness(NewBusiness business) async {
    final businessMap = business.toJson();
    businessMap.remove('addressDetails');

    return await apiClient.post<Business>(
      businessUrl,
      businessMap,
    );
  }

  Future<Business> updateBuisness({
    required NewBusiness business,
    required String businessId,
  }) async {
    final businessMap = business.toJson();
    businessMap.remove('addressDetails');
    return await apiClient.put<Business>(
      businessUrl + '/$businessId',
      businessMap,
    );
  }

  Future<Address> addBuisnessAddress(Address address) async {
    final addressMap = address.toJson();
    addressMap.remove('id');
    addressMap.remove('distance');

    return await apiClient.post<Address>(
      addAddressesUrl,
      addressMap,
    );
  }

  Future<void> deleteBusinessesAddress(String id) async {
    return await apiClient.delete<void>(
      addAddressesUrl + '/$id',
    );
  }

  Future<void> updateBusinessesAddress({
    required String id,
    required Address address,
  }) async {
    final addressMap = address.toJson();
    addressMap.remove('id');
    addressMap.remove('distance');
    return await apiClient.put<void>(
      addAddressesUrl + '/$id',
      addressMap,
    );
  }

  Future<void> deleteImage(
    String imageId,
  ) async {
    return await apiClient.delete<void>(
      uploadImageUrl + '/$imageId',
    );
  }

  Future<void> deleteBuisness(String businessId) async {
    return await apiClient.delete<void>(
      businessUrl + '/$businessId',
    );
  }
}
