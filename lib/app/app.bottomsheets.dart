// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/address_detail/address_detail_sheet.dart';
import '../ui/bottom_sheets/address_option/address_option_sheet.dart';
import '../ui/bottom_sheets/business_option/business_option_sheet.dart';
import '../ui/bottom_sheets/category/category_sheet.dart';
import '../ui/bottom_sheets/country_picker/country_picker_sheet.dart';
import '../ui/bottom_sheets/delete_item/delete_item_sheet.dart';
import '../ui/bottom_sheets/image_option/image_option_sheet.dart';
import '../ui/bottom_sheets/input_field/input_field_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/select_location/select_location_sheet.dart';
import '../ui/bottom_sheets/sub_categories/sub_categories_sheet.dart';
import '../ui/bottom_sheets/time_selection/time_selection_sheet.dart';
import '../ui/bottom_sheets/upload_image/upload_image_sheet.dart';

enum BottomSheetType {
  notice,
  countryPicker,
  category,
  selectLocation,
  subCategories,
  uploadImage,
  deleteItem,
  imageOption,
  addressOption,
  businessOption,
  timeSelection,
  addressDetail,
  inputField,
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
    BottomSheetType.selectLocation: (context, request, completer) =>
        SelectLocationSheet(request: request, completer: completer),
    BottomSheetType.subCategories: (context, request, completer) =>
        SubCategoriesSheet(request: request, completer: completer),
    BottomSheetType.uploadImage: (context, request, completer) =>
        UploadImageSheet(request: request, completer: completer),
    BottomSheetType.deleteItem: (context, request, completer) =>
        DeleteItemSheet(request: request, completer: completer),
    BottomSheetType.imageOption: (context, request, completer) =>
        ImageOptionSheet(request: request, completer: completer),
    BottomSheetType.addressOption: (context, request, completer) =>
        AddressOptionSheet(request: request, completer: completer),
    BottomSheetType.businessOption: (context, request, completer) =>
        BusinessOptionSheet(request: request, completer: completer),
    BottomSheetType.timeSelection: (context, request, completer) =>
        TimeSelectionSheet(request: request, completer: completer),
    BottomSheetType.addressDetail: (context, request, completer) =>
        AddressDetailSheet(request: request, completer: completer),
    BottomSheetType.inputField: (context, request, completer) =>
        InputFieldSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
