import 'dart:io';

import 'package:bnbit_app/api/category/category_apis.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/data_model/category/category.dart';

final fakeBusiness = NewBusiness(
  name: '',
  description: '',
);

class BusinessService {
  final log = getLogger('DogsService');
  final _categoryApis = locator<CategoryApis>();

  NewBusiness _newBusiness = fakeBusiness;
  NewBusiness get newBusiness => _newBusiness;

  Business? _selectedBusiness;
  Business? get selectedBusiness => _selectedBusiness;

  void setNewBusiness(NewBusiness business) => _newBusiness = business;
  void setSelectedBusiness(Business? business) => _selectedBusiness = business;

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  List<String> _removedAddresses = [];
  void setRemovedAddresses(String latlng) {
    if (!_removedAddresses.contains(latlng)) _removedAddresses.add(latlng);
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
    return await _categoryApis.getBusinesses(
      lat: lat,
      lng: lng,
      radius: radius,
      subCategory: subCategory,
      city: city,
      sub_city: sub_city,
      state: state,
      country: country,
      phone_number: phone_number,
      description: description,
      label: label,
      search: search,
      business: business,
      line1: line1,
      line2: line2,
      name: name,
    );
  }

  Future<List<Business>> getMyBusinesses() async {
    return await _categoryApis.getMyBusinesses();
  }

  Future<Business> getBusinessById(String businessId) async {
    return await _categoryApis.getBusinessById(businessId);
  }

  Future<List<Business>> getBusinessesById(List<String> businessesId) async {
    return await _categoryApis.getBusinessesById(businessesId);
  }

  Future<void> deleteBusiness(String businessId) async {
    return await _categoryApis.deleteBuisness(businessId);
  }

  Future<List<Category>> getCategoreis() async {
    final result = await _categoryApis.getCategoreis();

    _categories = result;
    log.d('categories:$_categories');
    return result;
  }

  Future<List<Address>> getAddresses(String url) async {
    return await _categoryApis.getAddresses(url);
  }

  Future<Image> uploadImage({
    required String business,
    required File image,
  }) async {
    final result =
        await _categoryApis.uploadImage(business: business, image: image);
    _selectedBusiness = await getBusinessById(business);
    return result;
  }

  Future<void> deleteImage(
    String imageId,
  ) async {
    await _categoryApis.deleteImage(imageId);
    _selectedBusiness = await getBusinessById(_selectedBusiness?.id ?? '');
  }

  Future<Business> createBusiness(NewBusiness business, File? image) async {
    final result = await _categoryApis.createBuisness(business);

    for (var address in business.addressDetails) {
      await _categoryApis.addBuisnessAddress(address.copyWith(
        subcategories: business.subcategories,
        business: result.id,
      ));
    }
    if (image != null) {
      await uploadImage(business: result.id, image: image);
    } else {
      _selectedBusiness = await getBusinessById(result.id);
    }
    return result;
  }

  Future<Business> updateBusiness({
    required NewBusiness business,
    required String businessId,
    bool isAddress = false,
  }) async {
    final result = await _categoryApis.updateBuisness(
      business: business,
      businessId: businessId,
    );

    List tempRemovedAddresses = [..._removedAddresses];
    log.d('tempRemovedAddresses: $_removedAddresses');
    tempRemovedAddresses.removeWhere((element) => !_selectedBusiness!.addresses
        .map((e) => e.latitude.toString() + e.longitude.toString())
        .toList()
        .contains(element));
    for (Address currentAddress in _selectedBusiness!.addresses) {
      String latlng = currentAddress.latitude.toString() +
          currentAddress.longitude.toString();
      if (tempRemovedAddresses.contains(latlng)) {
        await _categoryApis.deleteBusinessesAddress(currentAddress.id ?? '');
      } else {
        _categoryApis.updateBusinessesAddress(
            id: currentAddress.id!,
            address: newBusiness.addressDetails
                .where((element) => element.id == currentAddress.id!)
                .toList()
                .first);
      }
    }

    final addresses = [...business.addressDetails];
    addresses.removeWhere((element) => _selectedBusiness!.addresses
        .map((e) => e.latitude.toString() + e.longitude.toString())
        .toList()
        .contains(element.latitude.toString() + element.longitude.toString()));

    for (Address address in addresses) {
      await _categoryApis.addBuisnessAddress(address.copyWith(
        subcategories: business.subcategories,
        business: businessId,
      ));

      // final existingAddresses = [...business.addressDetails];
      // addresses.removeWhere((element) => _selectedBusiness!.addresses
      //     .map((e) => e.latitude.toString() + e.longitude.toString())
      //     .toList()
      //     .contains(
      //         element.latitude.toString() + element.longitude.toString()));

      // for (Address address in addresses) {
      //   await _categoryApis.addBuisnessAddress(address.copyWith(
      //     subcategories: business.subcategories,
      //     business: businessId,
      //   ));
      // }
      _removedAddresses.clear();
    }
    _selectedBusiness = await getBusinessById(result.id);

    return result;
  }

  Future<void> deleteAddress(String id) async {
    await _categoryApis.deleteBusinessesAddress(id);
    _selectedBusiness = await getBusinessById(selectedBusiness!.id);
  }
}
