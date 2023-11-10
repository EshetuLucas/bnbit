import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  Category._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Category({
    required String id,
    required String name,
    required int updated_by,
    String? description,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

List<Category> get fakeCategories => [
      Category(
        id: 'id1',
        name: 'Hotel & Travel',
        updated_by: 2,
      ),
      Category(
        id: 'id2',
        name: 'Things to Do',
        updated_by: 2,
      ),
      Category(
        id: 'id3',
        name: 'Retail',
        updated_by: 2,
      ),
      Category(
        id: 'id4',
        name: 'Health & Fitness',
        updated_by: 2,
      ),
      Category(
        id: 'id5',
        name: 'Food & Drink',
        updated_by: 2,
      ),
      Category(
        id: 'id6',
        name: 'Beauty & Spas',
        updated_by: 2,
      ),
    ];
