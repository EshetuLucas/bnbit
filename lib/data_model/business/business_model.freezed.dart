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
  UserModel get user => throw _privateConstructorUsedError;

  /// Business name
  String get name => throw _privateConstructorUsedError;

  /// Business type
  String get description => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;

  /// Business category
  Category? get category => throw _privateConstructorUsedError;

  /// Business category
  List<SubCategory> get subcategories => throw _privateConstructorUsedError;

  /// Addresses
  List<Address> get addresses => throw _privateConstructorUsedError;

  /// Address for UI purpose only
  Address? get address => throw _privateConstructorUsedError;

  /// Business image path
  String? get logo => throw _privateConstructorUsedError;
  String? get addressName => throw _privateConstructorUsedError;

  /// Images
  List<Image> get images => throw _privateConstructorUsedError;

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

  /// Business cover image
  String? get cover_image => throw _privateConstructorUsedError;

  /// Created at date and time for this business
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Updated at date and time for this business
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// This activated business, if [true]
  bool get active => throw _privateConstructorUsedError;

  /// We use this only in front-end to check whether the data
  /// has been synced or not
  bool get isSynced => throw _privateConstructorUsedError;

  /// services
  List<dynamic> get services => throw _privateConstructorUsedError;
  Map<String, OperatingHour?> get opening_hours =>
      throw _privateConstructorUsedError;

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
      UserModel user,
      String name,
      String description,
      double? distance,
      Category? category,
      List<SubCategory> subcategories,
      List<Address> addresses,
      Address? address,
      String? logo,
      String? addressName,
      List<Image> images,
      String? telegram,
      String? instagram,
      String? website,
      String? email,
      String? phone,
      String? cover_image,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool active,
      bool isSynced,
      List<dynamic> services,
      Map<String, OperatingHour?> opening_hours});

  $UserModelCopyWith<$Res> get user;
  $CategoryCopyWith<$Res>? get category;
  $AddressCopyWith<$Res>? get address;
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
    Object? distance = freezed,
    Object? category = freezed,
    Object? subcategories = null,
    Object? addresses = null,
    Object? address = freezed,
    Object? logo = freezed,
    Object? addressName = freezed,
    Object? images = null,
    Object? telegram = freezed,
    Object? instagram = freezed,
    Object? website = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? cover_image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = null,
    Object? isSynced = null,
    Object? services = null,
    Object? opening_hours = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      subcategories: null == subcategories
          ? _value.subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategory>,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
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
      cover_image: freezed == cover_image
          ? _value.cover_image
          : cover_image // ignore: cast_nullable_to_non_nullable
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
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      opening_hours: null == opening_hours
          ? _value.opening_hours
          : opening_hours // ignore: cast_nullable_to_non_nullable
              as Map<String, OperatingHour?>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
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
      UserModel user,
      String name,
      String description,
      double? distance,
      Category? category,
      List<SubCategory> subcategories,
      List<Address> addresses,
      Address? address,
      String? logo,
      String? addressName,
      List<Image> images,
      String? telegram,
      String? instagram,
      String? website,
      String? email,
      String? phone,
      String? cover_image,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool active,
      bool isSynced,
      List<dynamic> services,
      Map<String, OperatingHour?> opening_hours});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $AddressCopyWith<$Res>? get address;
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
    Object? distance = freezed,
    Object? category = freezed,
    Object? subcategories = null,
    Object? addresses = null,
    Object? address = freezed,
    Object? logo = freezed,
    Object? addressName = freezed,
    Object? images = null,
    Object? telegram = freezed,
    Object? instagram = freezed,
    Object? website = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? cover_image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = null,
    Object? isSynced = null,
    Object? services = null,
    Object? opening_hours = null,
  }) {
    return _then(_$BusinessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      subcategories: null == subcategories
          ? _value._subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategory>,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
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
      cover_image: freezed == cover_image
          ? _value.cover_image
          : cover_image // ignore: cast_nullable_to_non_nullable
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
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      opening_hours: null == opening_hours
          ? _value._opening_hours
          : opening_hours // ignore: cast_nullable_to_non_nullable
              as Map<String, OperatingHour?>,
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
      this.distance,
      this.category,
      required final List<SubCategory> subcategories,
      final List<Address> addresses = const [],
      this.address,
      this.logo,
      this.addressName,
      final List<Image> images = const [],
      this.telegram,
      this.instagram,
      this.website,
      this.email,
      this.phone,
      this.cover_image,
      this.createdAt,
      this.updatedAt,
      this.active = true,
      this.isSynced = true,
      final List<dynamic> services = const [],
      final Map<String, OperatingHour?> opening_hours = const {}})
      : _subcategories = subcategories,
        _addresses = addresses,
        _images = images,
        _services = services,
        _opening_hours = opening_hours,
        super._();

  factory _$BusinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessImplFromJson(json);

  /// Business Id (auto generated from firebase base)
  @override
  final String id;

  /// Business Owner's Id (user id who created this business)
  @override
  final UserModel user;

  /// Business name
  @override
  final String name;

  /// Business type
  @override
  final String description;
  @override
  final double? distance;

  /// Business category
  @override
  final Category? category;

  /// Business category
  final List<SubCategory> _subcategories;

  /// Business category
  @override
  List<SubCategory> get subcategories {
    if (_subcategories is EqualUnmodifiableListView) return _subcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subcategories);
  }

  /// Addresses
  final List<Address> _addresses;

  /// Addresses
  @override
  @JsonKey()
  List<Address> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  /// Address for UI purpose only
  @override
  final Address? address;

  /// Business image path
  @override
  final String? logo;
  @override
  final String? addressName;

  /// Images
  final List<Image> _images;

  /// Images
  @override
  @JsonKey()
  List<Image> get images {
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

  /// Business cover image
  @override
  final String? cover_image;

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

  /// services
  final List<dynamic> _services;

  /// services
  @override
  @JsonKey()
  List<dynamic> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final Map<String, OperatingHour?> _opening_hours;
  @override
  @JsonKey()
  Map<String, OperatingHour?> get opening_hours {
    if (_opening_hours is EqualUnmodifiableMapView) return _opening_hours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_opening_hours);
  }

  @override
  String toString() {
    return 'Business(id: $id, user: $user, name: $name, description: $description, distance: $distance, category: $category, subcategories: $subcategories, addresses: $addresses, address: $address, logo: $logo, addressName: $addressName, images: $images, telegram: $telegram, instagram: $instagram, website: $website, email: $email, phone: $phone, cover_image: $cover_image, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, isSynced: $isSynced, services: $services, opening_hours: $opening_hours)';
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
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._subcategories, _subcategories) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.telegram, telegram) ||
                other.telegram == telegram) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.cover_image, cover_image) ||
                other.cover_image == cover_image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._opening_hours, _opening_hours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        user,
        name,
        description,
        distance,
        category,
        const DeepCollectionEquality().hash(_subcategories),
        const DeepCollectionEquality().hash(_addresses),
        address,
        logo,
        addressName,
        const DeepCollectionEquality().hash(_images),
        telegram,
        instagram,
        website,
        email,
        phone,
        cover_image,
        createdAt,
        updatedAt,
        active,
        isSynced,
        const DeepCollectionEquality().hash(_services),
        const DeepCollectionEquality().hash(_opening_hours)
      ]);

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
      required final UserModel user,
      required final String name,
      required final String description,
      final double? distance,
      final Category? category,
      required final List<SubCategory> subcategories,
      final List<Address> addresses,
      final Address? address,
      final String? logo,
      final String? addressName,
      final List<Image> images,
      final String? telegram,
      final String? instagram,
      final String? website,
      final String? email,
      final String? phone,
      final String? cover_image,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool active,
      final bool isSynced,
      final List<dynamic> services,
      final Map<String, OperatingHour?> opening_hours}) = _$BusinessImpl;
  _Business._() : super._();

  factory _Business.fromJson(Map<String, dynamic> json) =
      _$BusinessImpl.fromJson;

  @override

  /// Business Id (auto generated from firebase base)
  String get id;
  @override

  /// Business Owner's Id (user id who created this business)
  UserModel get user;
  @override

  /// Business name
  String get name;
  @override

  /// Business type
  String get description;
  @override
  double? get distance;
  @override

  /// Business category
  Category? get category;
  @override

  /// Business category
  List<SubCategory> get subcategories;
  @override

  /// Addresses
  List<Address> get addresses;
  @override

  /// Address for UI purpose only
  Address? get address;
  @override

  /// Business image path
  String? get logo;
  @override
  String? get addressName;
  @override

  /// Images
  List<Image> get images;
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

  /// Business cover image
  String? get cover_image;
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

  /// services
  List<dynamic> get services;
  @override
  Map<String, OperatingHour?> get opening_hours;
  @override
  @JsonKey(ignore: true)
  _$$BusinessImplCopyWith<_$BusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewBusiness _$NewBusinessFromJson(Map<String, dynamic> json) {
  return _NewBusiness.fromJson(json);
}

/// @nodoc
mixin _$NewBusiness {
  /// Business name
  String get name => throw _privateConstructorUsedError;

  /// Business type
  String get description => throw _privateConstructorUsedError;

  /// Business telegram link
  String? get telegram => throw _privateConstructorUsedError;

  /// Business instagram link
  String? get instagram => throw _privateConstructorUsedError;

  /// Business website link
  String? get website => throw _privateConstructorUsedError;

  /// Business emai
  String? get email => throw _privateConstructorUsedError;

  /// Business email
  String? get country => throw _privateConstructorUsedError;

  /// Business email
  String? get logo => throw _privateConstructorUsedError;

  /// Business phone number
  String? get phone_number => throw _privateConstructorUsedError;

  /// Business cover image
  String? get cover_image => throw _privateConstructorUsedError;

  /// Updated at date and time for this business
  DateTime? get updated_at => throw _privateConstructorUsedError;

  /// Addresses
  List<Map<String, dynamic>> get subcategories =>
      throw _privateConstructorUsedError;

  /// Services
  List<String> get services => throw _privateConstructorUsedError;

  /// Addresses
  List<Address> get addressDetails => throw _privateConstructorUsedError;

  /// Addresses
  Map<String, OperatingHour?> get opening_hours =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewBusinessCopyWith<NewBusiness> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewBusinessCopyWith<$Res> {
  factory $NewBusinessCopyWith(
          NewBusiness value, $Res Function(NewBusiness) then) =
      _$NewBusinessCopyWithImpl<$Res, NewBusiness>;
  @useResult
  $Res call(
      {String name,
      String description,
      String? telegram,
      String? instagram,
      String? website,
      String? email,
      String? country,
      String? logo,
      String? phone_number,
      String? cover_image,
      DateTime? updated_at,
      List<Map<String, dynamic>> subcategories,
      List<String> services,
      List<Address> addressDetails,
      Map<String, OperatingHour?> opening_hours});
}

/// @nodoc
class _$NewBusinessCopyWithImpl<$Res, $Val extends NewBusiness>
    implements $NewBusinessCopyWith<$Res> {
  _$NewBusinessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? telegram = freezed,
    Object? instagram = freezed,
    Object? website = freezed,
    Object? email = freezed,
    Object? country = freezed,
    Object? logo = freezed,
    Object? phone_number = freezed,
    Object? cover_image = freezed,
    Object? updated_at = freezed,
    Object? subcategories = null,
    Object? services = null,
    Object? addressDetails = null,
    Object? opening_hours = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: freezed == phone_number
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      cover_image: freezed == cover_image
          ? _value.cover_image
          : cover_image // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subcategories: null == subcategories
          ? _value.subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addressDetails: null == addressDetails
          ? _value.addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      opening_hours: null == opening_hours
          ? _value.opening_hours
          : opening_hours // ignore: cast_nullable_to_non_nullable
              as Map<String, OperatingHour?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewBusinessImplCopyWith<$Res>
    implements $NewBusinessCopyWith<$Res> {
  factory _$$NewBusinessImplCopyWith(
          _$NewBusinessImpl value, $Res Function(_$NewBusinessImpl) then) =
      __$$NewBusinessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String? telegram,
      String? instagram,
      String? website,
      String? email,
      String? country,
      String? logo,
      String? phone_number,
      String? cover_image,
      DateTime? updated_at,
      List<Map<String, dynamic>> subcategories,
      List<String> services,
      List<Address> addressDetails,
      Map<String, OperatingHour?> opening_hours});
}

/// @nodoc
class __$$NewBusinessImplCopyWithImpl<$Res>
    extends _$NewBusinessCopyWithImpl<$Res, _$NewBusinessImpl>
    implements _$$NewBusinessImplCopyWith<$Res> {
  __$$NewBusinessImplCopyWithImpl(
      _$NewBusinessImpl _value, $Res Function(_$NewBusinessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? telegram = freezed,
    Object? instagram = freezed,
    Object? website = freezed,
    Object? email = freezed,
    Object? country = freezed,
    Object? logo = freezed,
    Object? phone_number = freezed,
    Object? cover_image = freezed,
    Object? updated_at = freezed,
    Object? subcategories = null,
    Object? services = null,
    Object? addressDetails = null,
    Object? opening_hours = null,
  }) {
    return _then(_$NewBusinessImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: freezed == phone_number
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      cover_image: freezed == cover_image
          ? _value.cover_image
          : cover_image // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subcategories: null == subcategories
          ? _value._subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addressDetails: null == addressDetails
          ? _value._addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      opening_hours: null == opening_hours
          ? _value._opening_hours
          : opening_hours // ignore: cast_nullable_to_non_nullable
              as Map<String, OperatingHour?>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NewBusinessImpl extends _NewBusiness {
  _$NewBusinessImpl(
      {required this.name,
      required this.description,
      this.telegram,
      this.instagram,
      this.website,
      this.email,
      this.country,
      this.logo,
      this.phone_number,
      this.cover_image,
      this.updated_at,
      final List<Map<String, dynamic>> subcategories = const [],
      final List<String> services = const [],
      final List<Address> addressDetails = const [],
      final Map<String, OperatingHour?> opening_hours = const {}})
      : _subcategories = subcategories,
        _services = services,
        _addressDetails = addressDetails,
        _opening_hours = opening_hours,
        super._();

  factory _$NewBusinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewBusinessImplFromJson(json);

  /// Business name
  @override
  final String name;

  /// Business type
  @override
  final String description;

  /// Business telegram link
  @override
  final String? telegram;

  /// Business instagram link
  @override
  final String? instagram;

  /// Business website link
  @override
  final String? website;

  /// Business emai
  @override
  final String? email;

  /// Business email
  @override
  final String? country;

  /// Business email
  @override
  final String? logo;

  /// Business phone number
  @override
  final String? phone_number;

  /// Business cover image
  @override
  final String? cover_image;

  /// Updated at date and time for this business
  @override
  final DateTime? updated_at;

  /// Addresses
  final List<Map<String, dynamic>> _subcategories;

  /// Addresses
  @override
  @JsonKey()
  List<Map<String, dynamic>> get subcategories {
    if (_subcategories is EqualUnmodifiableListView) return _subcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subcategories);
  }

  /// Services
  final List<String> _services;

  /// Services
  @override
  @JsonKey()
  List<String> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  /// Addresses
  final List<Address> _addressDetails;

  /// Addresses
  @override
  @JsonKey()
  List<Address> get addressDetails {
    if (_addressDetails is EqualUnmodifiableListView) return _addressDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressDetails);
  }

  /// Addresses
  final Map<String, OperatingHour?> _opening_hours;

  /// Addresses
  @override
  @JsonKey()
  Map<String, OperatingHour?> get opening_hours {
    if (_opening_hours is EqualUnmodifiableMapView) return _opening_hours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_opening_hours);
  }

  @override
  String toString() {
    return 'NewBusiness(name: $name, description: $description, telegram: $telegram, instagram: $instagram, website: $website, email: $email, country: $country, logo: $logo, phone_number: $phone_number, cover_image: $cover_image, updated_at: $updated_at, subcategories: $subcategories, services: $services, addressDetails: $addressDetails, opening_hours: $opening_hours)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewBusinessImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.telegram, telegram) ||
                other.telegram == telegram) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.phone_number, phone_number) ||
                other.phone_number == phone_number) &&
            (identical(other.cover_image, cover_image) ||
                other.cover_image == cover_image) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            const DeepCollectionEquality()
                .equals(other._subcategories, _subcategories) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._addressDetails, _addressDetails) &&
            const DeepCollectionEquality()
                .equals(other._opening_hours, _opening_hours));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      telegram,
      instagram,
      website,
      email,
      country,
      logo,
      phone_number,
      cover_image,
      updated_at,
      const DeepCollectionEquality().hash(_subcategories),
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_addressDetails),
      const DeepCollectionEquality().hash(_opening_hours));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewBusinessImplCopyWith<_$NewBusinessImpl> get copyWith =>
      __$$NewBusinessImplCopyWithImpl<_$NewBusinessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewBusinessImplToJson(
      this,
    );
  }
}

abstract class _NewBusiness extends NewBusiness {
  factory _NewBusiness(
      {required final String name,
      required final String description,
      final String? telegram,
      final String? instagram,
      final String? website,
      final String? email,
      final String? country,
      final String? logo,
      final String? phone_number,
      final String? cover_image,
      final DateTime? updated_at,
      final List<Map<String, dynamic>> subcategories,
      final List<String> services,
      final List<Address> addressDetails,
      final Map<String, OperatingHour?> opening_hours}) = _$NewBusinessImpl;
  _NewBusiness._() : super._();

  factory _NewBusiness.fromJson(Map<String, dynamic> json) =
      _$NewBusinessImpl.fromJson;

  @override

  /// Business name
  String get name;
  @override

  /// Business type
  String get description;
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

  /// Business emai
  String? get email;
  @override

  /// Business email
  String? get country;
  @override

  /// Business email
  String? get logo;
  @override

  /// Business phone number
  String? get phone_number;
  @override

  /// Business cover image
  String? get cover_image;
  @override

  /// Updated at date and time for this business
  DateTime? get updated_at;
  @override

  /// Addresses
  List<Map<String, dynamic>> get subcategories;
  @override

  /// Services
  List<String> get services;
  @override

  /// Addresses
  List<Address> get addressDetails;
  @override

  /// Addresses
  Map<String, OperatingHour?> get opening_hours;
  @override
  @JsonKey(ignore: true)
  _$$NewBusinessImplCopyWith<_$NewBusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OperatingHour _$OperatingHourFromJson(Map<String, dynamic> json) {
  return _OperatingHour.fromJson(json);
}

/// @nodoc
mixin _$OperatingHour {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperatingHourCopyWith<OperatingHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperatingHourCopyWith<$Res> {
  factory $OperatingHourCopyWith(
          OperatingHour value, $Res Function(OperatingHour) then) =
      _$OperatingHourCopyWithImpl<$Res, OperatingHour>;
  @useResult
  $Res call({DateTime startTime, DateTime endTime});
}

/// @nodoc
class _$OperatingHourCopyWithImpl<$Res, $Val extends OperatingHour>
    implements $OperatingHourCopyWith<$Res> {
  _$OperatingHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperatingHourImplCopyWith<$Res>
    implements $OperatingHourCopyWith<$Res> {
  factory _$$OperatingHourImplCopyWith(
          _$OperatingHourImpl value, $Res Function(_$OperatingHourImpl) then) =
      __$$OperatingHourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startTime, DateTime endTime});
}

/// @nodoc
class __$$OperatingHourImplCopyWithImpl<$Res>
    extends _$OperatingHourCopyWithImpl<$Res, _$OperatingHourImpl>
    implements _$$OperatingHourImplCopyWith<$Res> {
  __$$OperatingHourImplCopyWithImpl(
      _$OperatingHourImpl _value, $Res Function(_$OperatingHourImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$OperatingHourImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperatingHourImpl implements _OperatingHour {
  _$OperatingHourImpl({required this.startTime, required this.endTime});

  factory _$OperatingHourImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperatingHourImplFromJson(json);

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  @override
  String toString() {
    return 'OperatingHour(startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperatingHourImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperatingHourImplCopyWith<_$OperatingHourImpl> get copyWith =>
      __$$OperatingHourImplCopyWithImpl<_$OperatingHourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperatingHourImplToJson(
      this,
    );
  }
}

abstract class _OperatingHour implements OperatingHour {
  factory _OperatingHour(
      {required final DateTime startTime,
      required final DateTime endTime}) = _$OperatingHourImpl;

  factory _OperatingHour.fromJson(Map<String, dynamic> json) =
      _$OperatingHourImpl.fromJson;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  @JsonKey(ignore: true)
  _$$OperatingHourImplCopyWith<_$OperatingHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  String get image => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call({String image, String id, List<String>? types});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? id = null,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageImplCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$ImageImplCopyWith(
          _$ImageImpl value, $Res Function(_$ImageImpl) then) =
      __$$ImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image, String id, List<String>? types});
}

/// @nodoc
class __$$ImageImplCopyWithImpl<$Res>
    extends _$ImageCopyWithImpl<$Res, _$ImageImpl>
    implements _$$ImageImplCopyWith<$Res> {
  __$$ImageImplCopyWithImpl(
      _$ImageImpl _value, $Res Function(_$ImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? id = null,
    Object? types = freezed,
  }) {
    return _then(_$ImageImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageImpl implements _Image {
  const _$ImageImpl(
      {required this.image, required this.id, final List<String>? types})
      : _types = types;

  factory _$ImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageImplFromJson(json);

  @override
  final String image;
  @override
  final String id;
  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Image(image: $image, id: $id, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, image, id, const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      __$$ImageImplCopyWithImpl<_$ImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageImplToJson(
      this,
    );
  }
}

abstract class _Image implements Image {
  const factory _Image(
      {required final String image,
      required final String id,
      final List<String>? types}) = _$ImageImpl;

  factory _Image.fromJson(Map<String, dynamic> json) = _$ImageImpl.fromJson;

  @override
  String get image;
  @override
  String get id;
  @override
  List<String>? get types;
  @override
  @JsonKey(ignore: true)
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
