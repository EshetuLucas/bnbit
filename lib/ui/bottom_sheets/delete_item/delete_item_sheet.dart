import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'delete_item_sheet_model.dart';

class DeleteItemSheet extends StackedView<DeleteItemSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DeleteItemSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteItemSheetModel viewModel,
    Widget? child,
  ) {
    return FrostedBottomSheet(
      child: Padding(
        padding: appSymmetricEdgePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceSmall,
            const SvgBuilder(
              svg: trashSvg,
              height: 30,
              color: kcRed,
            ),
            if (!request.title.isNullOrEmpty) verticalSpace(18),
            Text(
              request.title ?? '',
              style: ktsSemiboldBlack(context).copyWith(
                  fontSize: 15, color: Theme.of(context).colorScheme.onPrimary),
            ),
            if (!request.title.isNullOrEmpty) verticalSpaceSmall,
            Padding(
              padding: appLeftEdgePadding,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      'Are you sure you want to delete?',
                      style: ktsSmall(context).copyWith(),
                    ),
                    Text(
                      request.description ??
                          'This action will delete it permanently.',
                      style: ktsSmall(context).copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpaceMedium,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: 45,
                    title: 'Cancel',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: AppButton(
                    height: 45,
                    backgroundColor: kcRed,
                    textColor: Theme.of(context).colorScheme.tertiary,
                    title: 'Delete',
                    onTap: () => completer?.call(
                      (SheetResponse(
                        confirmed: true,
                      )),
                    ),
                  ),
                )
              ],
            ),
            verticalSpaceMedium,
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }

  @override
  DeleteItemSheetModel viewModelBuilder(BuildContext context) =>
      DeleteItemSheetModel();
}
