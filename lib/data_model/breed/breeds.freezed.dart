// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breeds.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Breeds _$BreedsFromJson(Map<String, dynamic> json) {
  return _Breeds.fromJson(json);
}

/// @nodoc
mixin _$Breeds {
  Map<String, List<String>> get allBreeds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedsCopyWith<Breeds> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedsCopyWith<$Res> {
  factory $BreedsCopyWith(Breeds value, $Res Function(Breeds) then) =
      _$BreedsCopyWithImpl<$Res, Breeds>;
  @useResult
  $Res call({Map<String, List<String>> allBreeds});
}

/// @nodoc
class _$BreedsCopyWithImpl<$Res, $Val extends Breeds>
    implements $BreedsCopyWith<$Res> {
  _$BreedsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allBreeds = null,
  }) {
    return _then(_value.copyWith(
      allBreeds: null == allBreeds
          ? _value.allBreeds
          : allBreeds // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreedsImplCopyWith<$Res> implements $BreedsCopyWith<$Res> {
  factory _$$BreedsImplCopyWith(
          _$BreedsImpl value, $Res Function(_$BreedsImpl) then) =
      __$$BreedsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<String>> allBreeds});
}

/// @nodoc
class __$$BreedsImplCopyWithImpl<$Res>
    extends _$BreedsCopyWithImpl<$Res, _$BreedsImpl>
    implements _$$BreedsImplCopyWith<$Res> {
  __$$BreedsImplCopyWithImpl(
      _$BreedsImpl _value, $Res Function(_$BreedsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allBreeds = null,
  }) {
    return _then(_$BreedsImpl(
      allBreeds: null == allBreeds
          ? _value._allBreeds
          : allBreeds // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BreedsImpl extends _Breeds {
  _$BreedsImpl({final Map<String, List<String>> allBreeds = const {}})
      : _allBreeds = allBreeds,
        super._();

  factory _$BreedsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedsImplFromJson(json);

  final Map<String, List<String>> _allBreeds;
  @override
  @JsonKey()
  Map<String, List<String>> get allBreeds {
    if (_allBreeds is EqualUnmodifiableMapView) return _allBreeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_allBreeds);
  }

  @override
  String toString() {
    return 'Breeds(allBreeds: $allBreeds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedsImpl &&
            const DeepCollectionEquality()
                .equals(other._allBreeds, _allBreeds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_allBreeds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedsImplCopyWith<_$BreedsImpl> get copyWith =>
      __$$BreedsImplCopyWithImpl<_$BreedsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedsImplToJson(
      this,
    );
  }
}

abstract class _Breeds extends Breeds {
  factory _Breeds({final Map<String, List<String>> allBreeds}) = _$BreedsImpl;
  _Breeds._() : super._();

  factory _Breeds.fromJson(Map<String, dynamic> json) = _$BreedsImpl.fromJson;

  @override
  Map<String, List<String>> get allBreeds;
  @override
  @JsonKey(ignore: true)
  _$$BreedsImplCopyWith<_$BreedsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
