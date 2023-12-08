import 'package:bnbit_app/data_model/sub_category/sub_category.dart';
import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/app_check_box.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'sub_categories_sheet_model.dart';

// ignore: must_be_immutable
class SubCategoriesSheet extends StackedView<SubCategoriesSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  late List<SubCategory> items;
  late Map<String, dynamic> data;
  late List<SubCategory> selectedItems;
  SubCategoriesSheet({
    super.key,
    required this.completer,
    required this.request,
  }) {
    data = request.data;
    items = data['items'];
    selectedItems = data['selectedItems'] ?? [];
  }

  @override
  Widget builder(
    BuildContext context,
    SubCategoriesSheetModel viewModel,
    Widget? child,
  ) {
    final title = request.title ?? 'Select Sub Categories';

    return FrostedBottomSheet(
      child: AbsorbPointer(
        absorbing: viewModel.isBusy,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Text(
                title,
                style: ktsDarkSmall(context),
              ),
            ),
            verticalSpaceMedium,
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: items
                    .map(
                      (item) => InkWell(
                        onTap: () => viewModel.onSelectItem(item),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: appSymmetricEdgePadding,
                              child: SizedBox(
                                width: screenWidth(context),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      AbsorbPointer(
                                        absorbing: true,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: AppCheckBox(
                                            isSelected:
                                                viewModel.isSelected(item),
                                          ),
                                        ),
                                      ),
                                      horizontalSpaceSmall,
                                      horizontalSpaceSmall,
                                      Text(
                                        item.name,
                                        style:
                                            ktsBoldTextStyle(context).copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ),
                                      const Spacer(),
                                      horizontalSpaceSmall
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            verticalSpaceTiny,
                            const Divider(
                              height: 1.5,
                            ),
                            verticalSpaceTiny,
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: AppButton(
                enabled: viewModel.selectedItems.isNotEmpty,
                title: 'Select'
                    ' ${viewModel.selectedItems.isEmpty ? '' : '(${viewModel.selectedItems.length.toString()})'}',
                busy: viewModel.isBusy,
                onTap: () => completer?.call(
                  (SheetResponse(
                    data: viewModel.selectedItems,
                  )),
                ),
              ),
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }

  @override
  SubCategoriesSheetModel viewModelBuilder(BuildContext context) =>
      SubCategoriesSheetModel(selectedItems);
}
