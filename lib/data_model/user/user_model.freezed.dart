// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;

  /// [active] - if this is set to [false], that means the user created
  ///  an account but hasn't completed their account yet. This attribute is
  /// false by default. It will only be changed if the user completes account
  /// creation process. That means user should add thier full name and business
  bool get is_active => throw _privateConstructorUsedError;

  /// This controlls getting notifications
  /// This attribute is true by default that means users are notified whenever
  /// their is any changes to their busniesses, books or entries.
  bool get getNotifications => throw _privateConstructorUsedError;

  /// User email [optional]
  String? get email => throw _privateConstructorUsedError;

  /// User phone [optional]
  String? get phone => throw _privateConstructorUsedError;

  /// User first name [required]
  String get first_name => throw _privateConstructorUsedError;

  /// User first name [required]
  String? get last_name => throw _privateConstructorUsedError;
  DateTime? get last_login => throw _privateConstructorUsedError;
  String? get profilePicUrl => throw _privateConstructorUsedError;

  /// Created at date and time for this user
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Push notification tokens - these are device tokens that helps us to send
  /// push notifications to those devices
  Map<String, String> get userfcmTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      bool is_active,
      bool getNotifications,
      String? email,
      String? phone,
      String first_name,
      String? last_name,
      DateTime? last_login,
      String? profilePicUrl,
      DateTime? createdAt,
      Map<String, String> userfcmTokens});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? is_active = null,
    Object? getNotifications = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? first_name = null,
    Object? last_name = freezed,
    Object? last_login = freezed,
    Object? profilePicUrl = freezed,
    Object? createdAt = freezed,
    Object? userfcmTokens = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      getNotifications: null == getNotifications
          ? _value.getNotifications
          : getNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      first_name: null == first_name
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: freezed == last_name
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      last_login: freezed == last_login
          ? _value.last_login
          : last_login // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePicUrl: freezed == profilePicUrl
          ? _value.profilePicUrl
          : profilePicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userfcmTokens: null == userfcmTokens
          ? _value.userfcmTokens
          : userfcmTokens // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool is_active,
      bool getNotifications,
      String? email,
      String? phone,
      String first_name,
      String? last_name,
      DateTime? last_login,
      String? profilePicUrl,
      DateTime? createdAt,
      Map<String, String> userfcmTokens});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? is_active = null,
    Object? getNotifications = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? first_name = null,
    Object? last_name = freezed,
    Object? last_login = freezed,
    Object? profilePicUrl = freezed,
    Object? createdAt = freezed,
    Object? userfcmTokens = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      getNotifications: null == getNotifications
          ? _value.getNotifications
          : getNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      first_name: null == first_name
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: freezed == last_name
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      last_login: freezed == last_login
          ? _value.last_login
          : last_login // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePicUrl: freezed == profilePicUrl
          ? _value.profilePicUrl
          : profilePicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userfcmTokens: null == userfcmTokens
          ? _value._userfcmTokens
          : userfcmTokens // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserModelImpl extends _UserModel {
  _$UserModelImpl(
      {required this.id,
      this.is_active = false,
      this.getNotifications = true,
      this.email,
      this.phone,
      required this.first_name,
      this.last_name,
      this.last_login,
      this.profilePicUrl,
      this.createdAt,
      final Map<String, String> userfcmTokens = const {}})
      : _userfcmTokens = userfcmTokens,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;

  /// [active] - if this is set to [false], that means the user created
  ///  an account but hasn't completed their account yet. This attribute is
  /// false by default. It will only be changed if the user completes account
  /// creation process. That means user should add thier full name and business
  @override
  @JsonKey()
  final bool is_active;

  /// This controlls getting notifications
  /// This attribute is true by default that means users are notified whenever
  /// their is any changes to their busniesses, books or entries.
  @override
  @JsonKey()
  final bool getNotifications;

  /// User email [optional]
  @override
  final String? email;

  /// User phone [optional]
  @override
  final String? phone;

  /// User first name [required]
  @override
  final String first_name;

  /// User first name [required]
  @override
  final String? last_name;
  @override
  final DateTime? last_login;
  @override
  final String? profilePicUrl;

  /// Created at date and time for this user
  @override
  final DateTime? createdAt;

  /// Push notification tokens - these are device tokens that helps us to send
  /// push notifications to those devices
  final Map<String, String> _userfcmTokens;

  /// Push notification tokens - these are device tokens that helps us to send
  /// push notifications to those devices
  @override
  @JsonKey()
  Map<String, String> get userfcmTokens {
    if (_userfcmTokens is EqualUnmodifiableMapView) return _userfcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userfcmTokens);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, is_active: $is_active, getNotifications: $getNotifications, email: $email, phone: $phone, first_name: $first_name, last_name: $last_name, last_login: $last_login, profilePicUrl: $profilePicUrl, createdAt: $createdAt, userfcmTokens: $userfcmTokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.is_active, is_active) ||
                other.is_active == is_active) &&
            (identical(other.getNotifications, getNotifications) ||
                other.getNotifications == getNotifications) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.first_name, first_name) ||
                other.first_name == first_name) &&
            (identical(other.last_name, last_name) ||
                other.last_name == last_name) &&
            (identical(other.last_login, last_login) ||
                other.last_login == last_login) &&
            (identical(other.profilePicUrl, profilePicUrl) ||
                other.profilePicUrl == profilePicUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._userfcmTokens, _userfcmTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      is_active,
      getNotifications,
      email,
      phone,
      first_name,
      last_name,
      last_login,
      profilePicUrl,
      createdAt,
      const DeepCollectionEquality().hash(_userfcmTokens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  factory _UserModel(
      {required final String id,
      final bool is_active,
      final bool getNotifications,
      final String? email,
      final String? phone,
      required final String first_name,
      final String? last_name,
      final DateTime? last_login,
      final String? profilePicUrl,
      final DateTime? createdAt,
      final Map<String, String> userfcmTokens}) = _$UserModelImpl;
  _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override

  /// [active] - if this is set to [false], that means the user created
  ///  an account but hasn't completed their account yet. This attribute is
  /// false by default. It will only be changed if the user completes account
  /// creation process. That means user should add thier full name and business
  bool get is_active;
  @override

  /// This controlls getting notifications
  /// This attribute is true by default that means users are notified whenever
  /// their is any changes to their busniesses, books or entries.
  bool get getNotifications;
  @override

  /// User email [optional]
  String? get email;
  @override

  /// User phone [optional]
  String? get phone;
  @override

  /// User first name [required]
  String get first_name;
  @override

  /// User first name [required]
  String? get last_name;
  @override
  DateTime? get last_login;
  @override
  String? get profilePicUrl;
  @override

  /// Created at date and time for this user
  DateTime? get createdAt;
  @override

  /// Push notification tokens - these are device tokens that helps us to send
  /// push notifications to those devices
  Map<String, String> get userfcmTokens;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  String get id => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get profilePicUrl => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {String id,
      String? fullName,
      String? phoneNumber,
      String? profilePicUrl,
      String? email});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? profilePicUrl = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicUrl: freezed == profilePicUrl
          ? _value.profilePicUrl
          : profilePicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? fullName,
      String? phoneNumber,
      String? profilePicUrl,
      String? email});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? profilePicUrl = freezed,
    Object? email = freezed,
  }) {
    return _then(_$UserInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicUrl: freezed == profilePicUrl
          ? _value.profilePicUrl
          : profilePicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserInfoImpl extends _UserInfo {
  _$UserInfoImpl(
      {required this.id,
      this.fullName,
      this.phoneNumber,
      this.profilePicUrl,
      this.email})
      : super._();

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String? fullName;
  @override
  final String? phoneNumber;
  @override
  final String? profilePicUrl;
  @override
  final String? email;

  @override
  String toString() {
    return 'UserInfo(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, profilePicUrl: $profilePicUrl, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilePicUrl, profilePicUrl) ||
                other.profilePicUrl == profilePicUrl) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, phoneNumber, profilePicUrl, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo extends UserInfo {
  factory _UserInfo(
      {required final String id,
      final String? fullName,
      final String? phoneNumber,
      final String? profilePicUrl,
      final String? email}) = _$UserInfoImpl;
  _UserInfo._() : super._();

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  String get id;
  @override
  String? get fullName;
  @override
  String? get phoneNumber;
  @override
  String? get profilePicUrl;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
