import 'package:bnbit_app/data_model/sub_category/sub_category.dart';
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
    @Default([]) List<SubCategory> subcategories,
    String? description,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

List<Category> get fakeCategories => [
      Category(
        id: 'id1',
        name: 'Hotel & Travel',
      ),
      Category(
        id: 'id2',
        name: 'Things to Do',
      ),
      Category(
        id: 'id3',
        name: 'Retail',
      ),
      Category(
        id: 'id4',
        name: 'Health & Fitness',
      ),
      Category(
        id: 'id5',
        name: 'Food & Drink',
      ),
      Category(
        id: 'id6',
        name: 'Beauty & Spas',
      ),
    ];
