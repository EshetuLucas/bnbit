// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessImpl _$$BusinessImplFromJson(Map<String, dynamic> json) =>
    _$BusinessImpl(
      id: json['id'] as String,
      user: json['user'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      sub_category: json['sub_category'] as String,
      address: (json['address'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      logo: json['logo'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      telegram: json['telegram'] as String?,
      instagram: json['instagram'] as String?,
      website: json['website'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      active: json['active'] as bool? ?? true,
      isSynced: json['isSynced'] as bool? ?? true,
    );

Map<String, dynamic> _$$BusinessImplToJson(_$BusinessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'sub_category': instance.sub_category,
      'address': instance.address,
      'logo': instance.logo,
      'images': instance.images,
      'telegram': instance.telegram,
      'instagram': instance.instagram,
      'website': instance.website,
      'email': instance.email,
      'phone': instance.phone,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'active': instance.active,
      'isSynced': instance.isSynced,
    };
