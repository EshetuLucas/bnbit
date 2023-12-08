// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      is_active: json['is_active'] as bool? ?? false,
      getNotifications: json['getNotifications'] as bool? ?? true,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      last_login: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      profile_picture: json['profile_picture'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      userfcmTokens: (json['userfcmTokens'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      saved_business: (json['saved_business'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_active': instance.is_active,
      'getNotifications': instance.getNotifications,
      'email': instance.email,
      'phone': instance.phone,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'last_login': instance.last_login?.toIso8601String(),
      'profile_picture': instance.profile_picture,
      'createdAt': instance.createdAt?.toIso8601String(),
      'userfcmTokens': instance.userfcmTokens,
      'saved_business': instance.saved_business,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profilePicUrl: json['profilePicUrl'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'profilePicUrl': instance.profilePicUrl,
      'email': instance.email,
    };
