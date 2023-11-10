// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageModelImpl _$$LanguageModelImplFromJson(Map<String, dynamic> json) =>
    _$LanguageModelImpl(
      name: json['name'] as String? ?? 'English',
      tag: json['tag'] as String? ?? 'en',
      subTag: json['subTag'] as String? ?? 'en',
    );

Map<String, dynamic> _$$LanguageModelImplToJson(_$LanguageModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tag': instance.tag,
      'subTag': instance.subTag,
    };

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      id: json['id'] as int? ?? 1,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      code: json['code'] as String? ?? '',
      dialCode: json['dialCode'] as String? ?? '',
      flag: json['flag'] as String? ?? '',
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'code': instance.code,
      'dialCode': instance.dialCode,
      'flag': instance.flag,
    };
