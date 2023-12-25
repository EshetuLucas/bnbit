import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/category/category.dart';
import 'package:bnbit_app/data_model/sub_category/sub_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
part 'business_model.freezed.dart';
part 'business_model.g.dart';

@freezed
class Business with _$Business {
  Business._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Business({
    /// Business Id (auto generated from firebase base)
    required String id,

    /// Business Owner's Id (user id who created this business)
    required UserModel user,

    /// Business name
    required String name,

    /// Business type
    required String description,
    double? distance,

    /// Business category
    Category? category,

    /// Business category
    required List<SubCategory> subcategories,

    /// Addresses
    @Default([]) List<Address> addresses,

    /// Address for UI purpose only
    Address? address,

    /// Business image path

    String? logo,
    String? addressName,

    /// Images
    @Default([]) List<Image> images,

    /// Business telegram link
    String? telegram,

    /// Business instagram link
    String? instagram,

    /// Business website link
    String? website,

    /// Business email
    String? email,

    /// Business phone number
    String? phone,

    /// Business cover image
    String? cover_image,

    /// Created at date and time for this business
    DateTime? createdAt,

    /// Updated at date and time for this business

    DateTime? updatedAt,

    /// This activated business, if [true]
    @Default(true) bool active,

    /// We use this only in front-end to check whether the data
    /// has been synced or not
    @Default(true) bool isSynced,

    /// services
    @Default([]) List<BusinessServiceModel> services,
    @Default({}) Map<String, OperatingHour?> opening_hours,
  }) = _Business;

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);
}

@freezed
class NewBusiness with _$NewBusiness {
  NewBusiness._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory NewBusiness({
    /// Business name
    required String name,

    /// Business type
    required String description,

    /// Business telegram link
    String? telegram,

    /// Business instagram link
    String? instagram,

    /// Business website link
    String? website,

    /// Business emai
    String? email,

    /// Business email
    String? country,

    /// Business email
    String? logo,

    /// Business phone number
    String? phone_number,

    /// Business cover image
    String? cover_image,

    /// Updated at date and time for this business

    DateTime? updated_at,

    /// Addresses
    @Default([]) List<Map<String, dynamic>> subcategories,

    /// Services
    @Default([]) List<BusinessServiceModel> services,

    /// Addresses
    @Default([]) List<Address> addressDetails,

    /// Addresses
    @Default({}) Map<String, OperatingHour?> opening_hours,
  }) = _NewBusiness;

  factory NewBusiness.fromJson(Map<String, dynamic> json) =>
      _$NewBusinessFromJson(json);
}

@freezed
class OperatingHour with _$OperatingHour {
  factory OperatingHour({
    required DateTime startTime,
    required DateTime endTime,
  }) = _OperatingHour;

  factory OperatingHour.fromJson(Map<String, dynamic> json) =>
      _$OperatingHourFromJson(json);
}

@freezed
class BusinessServiceModel with _$BusinessServiceModel {
  factory BusinessServiceModel({
    required String service,
    required double price,
    String? currency,
  }) = _BusinessServiceModel;

  factory BusinessServiceModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessServiceModelFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    required String image,
    required String id,
    List<String>? types,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

List<Business> get fakeBusinesses => [
      Business(
        id: "id",
        user: UserModel(id: '', first_name: 'first_name'),
        name: "Wow Coffee and ",
        description: 'description',
        addressName: 'Business location location ',
        distance: 300,
        category: Category(
          id: '1',
          name: 'name',
        ),
        subcategories: [
          SubCategory(
            name: "Sub category",
            id: 'id',
            category: 'category',
          )
        ],
      ),
      Business(
        distance: 300,
        addressName: 'Business location location ',
        id: "id",
        user: UserModel(id: '', first_name: 'first_name'),
        name: "Ardent coffe and ",
        description: 'description',
        category: Category(
          id: '1',
          name: 'name',
        ),
        subcategories: [
          SubCategory(
            name: "Sub category",
            id: 'id',
            category: 'category',
          )
        ],
      ),
      Business(
        distance: 300,
        addressName: 'Business location ',
        id: "id",
        user: UserModel(id: '', first_name: 'first_name'),
        name: "Burger",
        description: 'description',
        category: Category(
          id: '1',
          name: 'name',
        ),
        subcategories: [
          SubCategory(
            name: "Sub category",
            id: 'id',
            category: 'category',
          )
        ],
      ),
      Business(
        addressName: 'Business location location ',
        distance: 300,
        id: "id",
        user: UserModel(id: '', first_name: 'first_name'),
        name: "Wow Coffee and ",
        description: 'description',
        category: Category(
          id: '1',
          name: 'name',
        ),
        subcategories: [
          SubCategory(
            name: "Sub category",
            id: 'id',
            category: 'category',
          )
        ],
      ),
      Business(
        addressName: 'Business location location ',
        distance: 300,
        id: "id",
        user: UserModel(id: '', first_name: 'first_name'),
        name: "Wow Coffee and ",
        description: 'description',
        category: Category(
          id: '1',
          name: 'name',
        ),
        subcategories: [
          SubCategory(
            name: "Sub category",
            id: 'id',
            category: 'category',
          )
        ],
      ),
    ];
