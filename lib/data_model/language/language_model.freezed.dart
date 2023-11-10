// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) {
  return _LanguageModel.fromJson(json);
}

/// @nodoc
mixin _$LanguageModel {
  String get name => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String get subTag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageModelCopyWith<LanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageModelCopyWith<$Res> {
  factory $LanguageModelCopyWith(
          LanguageModel value, $Res Function(LanguageModel) then) =
      _$LanguageModelCopyWithImpl<$Res, LanguageModel>;
  @useResult
  $Res call({String name, String tag, String subTag});
}

/// @nodoc
class _$LanguageModelCopyWithImpl<$Res, $Val extends LanguageModel>
    implements $LanguageModelCopyWith<$Res> {
  _$LanguageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? tag = null,
    Object? subTag = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      subTag: null == subTag
          ? _value.subTag
          : subTag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageModelImplCopyWith<$Res>
    implements $LanguageModelCopyWith<$Res> {
  factory _$$LanguageModelImplCopyWith(
          _$LanguageModelImpl value, $Res Function(_$LanguageModelImpl) then) =
      __$$LanguageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String tag, String subTag});
}

/// @nodoc
class __$$LanguageModelImplCopyWithImpl<$Res>
    extends _$LanguageModelCopyWithImpl<$Res, _$LanguageModelImpl>
    implements _$$LanguageModelImplCopyWith<$Res> {
  __$$LanguageModelImplCopyWithImpl(
      _$LanguageModelImpl _value, $Res Function(_$LanguageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? tag = null,
    Object? subTag = null,
  }) {
    return _then(_$LanguageModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      subTag: null == subTag
          ? _value.subTag
          : subTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageModelImpl extends _LanguageModel {
  _$LanguageModelImpl(
      {this.name = 'English', this.tag = 'en', this.subTag = 'en'})
      : super._();

  factory _$LanguageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageModelImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String tag;
  @override
  @JsonKey()
  final String subTag;

  @override
  String toString() {
    return 'LanguageModel(name: $name, tag: $tag, subTag: $subTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.subTag, subTag) || other.subTag == subTag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, tag, subTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageModelImplCopyWith<_$LanguageModelImpl> get copyWith =>
      __$$LanguageModelImplCopyWithImpl<_$LanguageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageModelImplToJson(
      this,
    );
  }
}

abstract class _LanguageModel extends LanguageModel {
  factory _LanguageModel(
      {final String name,
      final String tag,
      final String subTag}) = _$LanguageModelImpl;
  _LanguageModel._() : super._();

  factory _LanguageModel.fromJson(Map<String, dynamic> json) =
      _$LanguageModelImpl.fromJson;

  @override
  String get name;
  @override
  String get tag;
  @override
  String get subTag;
  @override
  @JsonKey(ignore: true)
  _$$LanguageModelImplCopyWith<_$LanguageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get dialCode => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String code,
      String dialCode,
      String flag});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? code = null,
    Object? dialCode = null,
    Object? flag = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: null == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String code,
      String dialCode,
      String flag});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? code = null,
    Object? dialCode = null,
    Object? flag = null,
  }) {
    return _then(_$CountryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: null == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryImpl implements _Country {
  _$CountryImpl(
      {this.id = 1,
      required this.name,
      this.description = '',
      this.code = '',
      this.dialCode = '',
      this.flag = ''});

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String dialCode;
  @override
  @JsonKey()
  final String flag;

  @override
  String toString() {
    return 'Country(id: $id, name: $name, description: $description, code: $code, dialCode: $dialCode, flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, code, dialCode, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  factory _Country(
      {final int id,
      required final String name,
      final String description,
      final String code,
      final String dialCode,
      final String flag}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get code;
  @override
  String get dialCode;
  @override
  String get flag;
  @override
  @JsonKey(ignore: true)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
