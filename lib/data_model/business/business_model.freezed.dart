// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Business _$BusinessFromJson(Map<String, dynamic> json) {
  return _Business.fromJson(json);
}

/// @nodoc
mixin _$Business {
  /// Business Id (auto generated from firebase base)
  String get id => throw _privateConstructorUsedError;

  /// Business Owner's Id (user id who created this business)
  int get user => throw _privateConstructorUsedError;

  /// Business name
  String get name => throw _privateConstructorUsedError;

  /// Business type
  String get description => throw _privateConstructorUsedError;

  /// Business category
  String get category => throw _privateConstructorUsedError;

  /// Business category
  String get sub_category => throw _privateConstructorUsedError;

  /// Addresses
  List<String> get address => throw _privateConstructorUsedError;

  /// Business image path
  String? get logo => throw _privateConstructorUsedError;

  /// Images
  List<String> get images => throw _privateConstructorUsedError;

  /// Business telegram link
  String? get telegram => throw _privateConstructorUsedError;

  /// Business instagram link
  String? get instagram => throw _privateConstructorUsedError;

  /// Business website link
  String? get website => throw _privateConstructorUsedError;

  /// Business email
  String? get email => throw _privateConstructorUsedError;

  /// Business phone number
  String? get phone => throw _privateConstructorUsedError;

  /// Created at date and time for this business
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Updated at date and time for this business
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// This activated business, if [true]
  bool get active => throw _privateConstructorUsedError;

  /// We use this only in front-end to check whether the data
  /// has been synced or not
  bool get isSynced => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessCopyWith<Business> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessCopyWith<$Res> {
  factory $BusinessCopyWith(Business value, $Res Function(Business) then) =
      _$BusinessCopyWithImpl<$Res, Business>;
  @useResult
  $Res call(
      {String id,
      int user,
      String name,
      String description,
      String category,
      String sub_category,
      List<String> address,
      String? logo,
      List<String> images,
      String? telegram,
      String? instagram,
      String? website,
      String? email,
      String? phone,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool active,
      bool isSynced});
}

/// @nodoc
class _$BusinessCopyWithImpl<$Res, $Val extends Business>
    implements $BusinessCopyWith<$Res> {
  _$BusinessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? sub_category = null,
    Object? address = null,
    Object? logo = freezed,
    Object? images = null,
    Object? telegram = freezed,
    Object? instagram = freezed,
    Object? website = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = null,
    Object? isSynced = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sub_category: null == sub_category
          ? _value.sub_category
          : sub_category // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<String>,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      telegram: freezed == telegram
          ? _value.telegram
          : telegram // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessImplCopyWith<$Res>
    implements $BusinessCopyWith<$Res> {
  factory _$$BusinessImplCopyWith(
          _$BusinessImpl value, $Res Function(_$BusinessImpl) then) =
      __$$BusinessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int user,
      String name,
      String description,
      String category,
      String sub_category,
      List<String> address,
      String? logo,
      List<String> images,
      String? telegram,
      String? instagram,
      String? website,
      String? email,
      String? phone,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool active,
      bool isSynced});
}

/// @nodoc
class __$$BusinessImplCopyWithImpl<$Res>
    extends _$BusinessCopyWithImpl<$Res, _$BusinessImpl>
    implements _$$BusinessImplCopyWith<$Res> {
  __$$BusinessImplCopyWithImpl(
      _$BusinessImpl _value, $Res Function(_$BusinessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? sub_category = null,
    Object? address = null,
    Object? logo = freezed,
    Object? images = null,
    Object? telegram = freezed,
    Object? instagram = freezed,
    Object? website = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = null,
    Object? isSynced = null,
  }) {
    return _then(_$BusinessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      sub_category: null == sub_category
          ? _value.sub_category
          : sub_category // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<String>,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      telegram: freezed == telegram
          ? _value.telegram
          : telegram // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BusinessImpl extends _Business {
  _$BusinessImpl(
      {required this.id,
      required this.user,
      required this.name,
      required this.description,
      required this.category,
      required this.sub_category,
      final List<String> address = const [],
      this.logo,
      final List<String> images = const [],
      this.telegram,
      this.instagram,
      this.website,
      this.email,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.active = true,
      this.isSynced = true})
      : _address = address,
        _images = images,
        super._();

  factory _$BusinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessImplFromJson(json);

  /// Business Id (auto generated from firebase base)
  @override
  final String id;

  /// Business Owner's Id (user id who created this business)
  @override
  final int user;

  /// Business name
  @override
  final String name;

  /// Business type
  @override
  final String description;

  /// Business category
  @override
  final String category;

  /// Business category
  @override
  final String sub_category;

  /// Addresses
  final List<String> _address;

  /// Addresses
  @override
  @JsonKey()
  List<String> get address {
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_address);
  }

  /// Business image path
  @override
  final String? logo;

  /// Images
  final List<String> _images;

  /// Images
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Business telegram link
  @override
  final String? telegram;

  /// Business instagram link
  @override
  final String? instagram;

  /// Business website link
  @override
  final String? website;

  /// Business email
  @override
  final String? email;

  /// Business phone number
  @override
  final String? phone;

  /// Created at date and time for this business
  @override
  final DateTime? createdAt;

  /// Updated at date and time for this business
  @override
  final DateTime? updatedAt;

  /// This activated business, if [true]
  @override
  @JsonKey()
  final bool active;

  /// We use this only in front-end to check whether the data
  /// has been synced or not
  @override
  @JsonKey()
  final bool isSynced;

  @override
  String toString() {
    return 'Business(id: $id, user: $user, name: $name, description: $description, category: $category, sub_category: $sub_category, address: $address, logo: $logo, images: $images, telegram: $telegram, instagram: $instagram, website: $website, email: $email, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, isSynced: $isSynced)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.sub_category, sub_category) ||
                other.sub_category == sub_category) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.telegram, telegram) ||
                other.telegram == telegram) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      name,
      description,
      category,
      sub_category,
      const DeepCollectionEquality().hash(_address),
      logo,
      const DeepCollectionEquality().hash(_images),
      telegram,
      instagram,
      website,
      email,
      phone,
      createdAt,
      updatedAt,
      active,
      isSynced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessImplCopyWith<_$BusinessImpl> get copyWith =>
      __$$BusinessImplCopyWithImpl<_$BusinessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessImplToJson(
      this,
    );
  }
}

abstract class _Business extends Business {
  factory _Business(
      {required final String id,
      required final int user,
      required final String name,
      required final String description,
      required final String category,
      required final String sub_category,
      final List<String> address,
      final String? logo,
      final List<String> images,
      final String? telegram,
      final String? instagram,
      final String? website,
      final String? email,
      final String? phone,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool active,
      final bool isSynced}) = _$BusinessImpl;
  _Business._() : super._();

  factory _Business.fromJson(Map<String, dynamic> json) =
      _$BusinessImpl.fromJson;

  @override

  /// Business Id (auto generated from firebase base)
  String get id;
  @override

  /// Business Owner's Id (user id who created this business)
  int get user;
  @override

  /// Business name
  String get name;
  @override

  /// Business type
  String get description;
  @override

  /// Business category
  String get category;
  @override

  /// Business category
  String get sub_category;
  @override

  /// Addresses
  List<String> get address;
  @override

  /// Business image path
  String? get logo;
  @override

  /// Images
  List<String> get images;
  @override

  /// Business telegram link
  String? get telegram;
  @override

  /// Business instagram link
  String? get instagram;
  @override

  /// Business website link
  String? get website;
  @override

  /// Business email
  String? get email;
  @override

  /// Business phone number
  String? get phone;
  @override

  /// Created at date and time for this business
  DateTime? get createdAt;
  @override

  /// Updated at date and time for this business
  DateTime? get updatedAt;
  @override

  /// This activated business, if [true]
  bool get active;
  @override

  /// We use this only in front-end to check whether the data
  /// has been synced or not
  bool get isSynced;
  @override
  @JsonKey(ignore: true)
  _$$BusinessImplCopyWith<_$BusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
