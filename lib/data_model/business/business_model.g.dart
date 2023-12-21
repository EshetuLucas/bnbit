// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessImpl _$$BusinessImplFromJson(Map<String, dynamic> json) =>
    _$BusinessImpl(
      id: json['id'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String,
      distance: (json['distance'] as num?)?.toDouble(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      subcategories: (json['subcategories'] as List<dynamic>)
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      logo: json['logo'] as String?,
      addressName: json['addressName'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      telegram: json['telegram'] as String?,
      instagram: json['instagram'] as String?,
      website: json['website'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      cover_image: json['cover_image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      active: json['active'] as bool? ?? true,
      isSynced: json['isSynced'] as bool? ?? true,
      services: (json['services'] as List<dynamic>?)
              ?.map((e) =>
                  BusinessServiceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      opening_hours: (json['opening_hours'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k,
                e == null
                    ? null
                    : OperatingHour.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$BusinessImplToJson(_$BusinessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'name': instance.name,
      'description': instance.description,
      'distance': instance.distance,
      'category': instance.category?.toJson(),
      'subcategories': instance.subcategories.map((e) => e.toJson()).toList(),
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
      'address': instance.address?.toJson(),
      'logo': instance.logo,
      'addressName': instance.addressName,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'telegram': instance.telegram,
      'instagram': instance.instagram,
      'website': instance.website,
      'email': instance.email,
      'phone': instance.phone,
      'cover_image': instance.cover_image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'active': instance.active,
      'isSynced': instance.isSynced,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'opening_hours':
          instance.opening_hours.map((k, e) => MapEntry(k, e?.toJson())),
    };

_$NewBusinessImpl _$$NewBusinessImplFromJson(Map<String, dynamic> json) =>
    _$NewBusinessImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      telegram: json['telegram'] as String?,
      instagram: json['instagram'] as String?,
      website: json['website'] as String?,
      email: json['email'] as String?,
      country: json['country'] as String?,
      logo: json['logo'] as String?,
      phone_number: json['phone_number'] as String?,
      cover_image: json['cover_image'] as String?,
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      services: (json['services'] as List<dynamic>?)
              ?.map((e) =>
                  BusinessServiceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      addressDetails: (json['addressDetails'] as List<dynamic>?)
              ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      opening_hours: (json['opening_hours'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k,
                e == null
                    ? null
                    : OperatingHour.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$NewBusinessImplToJson(_$NewBusinessImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'telegram': instance.telegram,
      'instagram': instance.instagram,
      'website': instance.website,
      'email': instance.email,
      'country': instance.country,
      'logo': instance.logo,
      'phone_number': instance.phone_number,
      'cover_image': instance.cover_image,
      'updated_at': instance.updated_at?.toIso8601String(),
      'subcategories': instance.subcategories,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'addressDetails': instance.addressDetails.map((e) => e.toJson()).toList(),
      'opening_hours':
          instance.opening_hours.map((k, e) => MapEntry(k, e?.toJson())),
    };

_$OperatingHourImpl _$$OperatingHourImplFromJson(Map<String, dynamic> json) =>
    _$OperatingHourImpl(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$$OperatingHourImplToJson(_$OperatingHourImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
    };

_$BusinessServiceModelImpl _$$BusinessServiceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessServiceModelImpl(
      service: json['service'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$BusinessServiceModelImplToJson(
        _$BusinessServiceModelImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'price': instance.price,
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      image: json['image'] as String,
      id: json['id'] as String,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'id': instance.id,
      'types': instance.types,
    };
