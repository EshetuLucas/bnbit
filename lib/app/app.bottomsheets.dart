// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/category/category_sheet.dart';
import '../ui/bottom_sheets/country_picker/country_picker_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  countryPicker,
  category,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.countryPicker: (context, request, completer) =>
        CountryPickerSheet(request: request, completer: completer),
    BottomSheetType.category: (context, request, completer) =>
        CategorySheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
