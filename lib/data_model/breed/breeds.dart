import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeds.freezed.dart';
part 'breeds.g.dart';

@freezed
class Breeds with _$Breeds {
  Breeds._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Breeds({
    @Default({}) Map<String, List<String>> allBreeds,
  }) = _Breeds;

  factory Breeds.fromJson(Map<String, dynamic> json) => _$BreedsFromJson(json);
}
