// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dogs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dogs _$DogsFromJson(Map<String, dynamic> json) {
  return _Dogs.fromJson(json);
}

/// @nodoc
mixin _$Dogs {
  List<String> get imageUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DogsCopyWith<Dogs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogsCopyWith<$Res> {
  factory $DogsCopyWith(Dogs value, $Res Function(Dogs) then) =
      _$DogsCopyWithImpl<$Res, Dogs>;
  @useResult
  $Res call({List<String> imageUrls});
}

/// @nodoc
class _$DogsCopyWithImpl<$Res, $Val extends Dogs>
    implements $DogsCopyWith<$Res> {
  _$DogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = null,
  }) {
    return _then(_value.copyWith(
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DogsImplCopyWith<$Res> implements $DogsCopyWith<$Res> {
  factory _$$DogsImplCopyWith(
          _$DogsImpl value, $Res Function(_$DogsImpl) then) =
      __$$DogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> imageUrls});
}

/// @nodoc
class __$$DogsImplCopyWithImpl<$Res>
    extends _$DogsCopyWithImpl<$Res, _$DogsImpl>
    implements _$$DogsImplCopyWith<$Res> {
  __$$DogsImplCopyWithImpl(_$DogsImpl _value, $Res Function(_$DogsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = null,
  }) {
    return _then(_$DogsImpl(
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DogsImpl extends _Dogs {
  _$DogsImpl({final List<String> imageUrls = const []})
      : _imageUrls = imageUrls,
        super._();

  factory _$DogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DogsImplFromJson(json);

  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  String toString() {
    return 'Dogs(imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DogsImpl &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_imageUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DogsImplCopyWith<_$DogsImpl> get copyWith =>
      __$$DogsImplCopyWithImpl<_$DogsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DogsImplToJson(
      this,
    );
  }
}

abstract class _Dogs extends Dogs {
  factory _Dogs({final List<String> imageUrls}) = _$DogsImpl;
  _Dogs._() : super._();

  factory _Dogs.fromJson(Map<String, dynamic> json) = _$DogsImpl.fromJson;

  @override
  List<String> get imageUrls;
  @override
  @JsonKey(ignore: true)
  _$$DogsImplCopyWith<_$DogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
