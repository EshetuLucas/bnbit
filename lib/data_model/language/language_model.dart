import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class LanguageModel with _$LanguageModel {
  LanguageModel._();
  factory LanguageModel({
    @Default('English') String name,
    @Default('en') String tag,
    @Default('en') String subTag,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}

@freezed
class Country with _$Country {
  factory Country({
    @Default(1) int id,
    required String name,
    @Default('') String description,
    @Default('') String code,
    @Default('') String dialCode,
    @Default('') String flag,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
