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
    required int user,

    /// Business name
    required String name,

    /// Business type
    required String description,

    /// Business category
    required String category,

    /// Business category
    required String sub_category,

    /// Addresses
    @Default([]) List<String> address,

    /// Business image path

    String? logo,

    /// Images
    @Default([]) List<String> images,

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

    /// Created at date and time for this business
    DateTime? createdAt,

    /// Updated at date and time for this business

    DateTime? updatedAt,

    /// This activated business, if [true]
    @Default(true) bool active,

    /// We use this only in front-end to check whether the data
    /// has been synced or not
    @Default(true) bool isSynced,
  }) = _Business;

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);
}
