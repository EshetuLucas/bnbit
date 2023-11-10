import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category.freezed.dart';
part 'sub_category.g.dart';

@freezed
class SubCategory with _$SubCategory {
  factory SubCategory({
    required String name,
    required String svg,
    required String id,
    required String category,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}

List<SubCategory> get fakeSubCategories => [
      SubCategory(
        name: 'Hotels',
        svg: hotelSvg,
        id: 'id1',
        category: 'categoryId1',
      ),
      SubCategory(
          name: 'Resorts', svg: resortSvg, id: 'id2', category: 'categoryId2'),
      SubCategory(
        name: 'Guesthouses',
        svg: guestHousesSvg,
        id: 'id3',
        category: 'categoryId3',
      ),
    ];
