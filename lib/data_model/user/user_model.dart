import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  UserModel._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    required String id,

    /// [active] - if this is set to [false], that means the user created
    ///  an account but hasn't completed their account yet. This attribute is
    /// false by default. It will only be changed if the user completes account
    /// creation process. That means user should add thier full name and business
    @Default(false) bool is_active,

    /// This controlls getting notifications
    /// This attribute is true by default that means users are notified whenever
    /// their is any changes to their busniesses, books or entries.
    @Default(true) bool getNotifications,

    /// User email [optional]
    String? email,

    /// User phone [optional]
    String? phone,

    /// User first name [required]
    required String first_name,

    /// User first name [required]
    String? last_name,
    DateTime? last_login,
    String? profilePicUrl,

    /// Created at date and time for this user
    DateTime? createdAt,

    /// Push notification tokens - these are device tokens that helps us to send
    /// push notifications to those devices
    @Default({}) Map<String, String> userfcmTokens,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

/// This is portion of user info
@freezed
class UserInfo with _$UserInfo {
  UserInfo._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory UserInfo({
    required String id,
    String? fullName,
    String? phoneNumber,
    String? profilePicUrl,
    String? email,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
