// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreedsImpl _$$BreedsImplFromJson(Map<String, dynamic> json) => _$BreedsImpl(
      allBreeds: (json['allBreeds'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$BreedsImplToJson(_$BreedsImpl instance) =>
    <String, dynamic>{
      'allBreeds': instance.allBreeds,
    };
