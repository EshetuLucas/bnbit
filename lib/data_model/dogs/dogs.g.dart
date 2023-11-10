// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DogsImpl _$$DogsImplFromJson(Map<String, dynamic> json) => _$DogsImpl(
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DogsImplToJson(_$DogsImpl instance) =>
    <String, dynamic>{
      'imageUrls': instance.imageUrls,
    };
