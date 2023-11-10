import 'package:freezed_annotation/freezed_annotation.dart';

part 'dogs.freezed.dart';
part 'dogs.g.dart';

@freezed
class Dogs with _$Dogs {
  Dogs._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Dogs({
    @Default([]) List<String> imageUrls,
  }) = _Dogs;

  factory Dogs.fromJson(Map<String, dynamic> json) => _$DogsFromJson(json);
}


