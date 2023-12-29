// ignore_for_file: must_be_immutable

import 'package:bnbit_app/data_model/category/category.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/shared_styles.dart';
import '../basic_bottom_sheet.dart';
import 'category_sheet_model.dart';

class CategorySheet extends StackedView<CategorySheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  List<Category> items = [];
  CategorySheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key) {
    items = request.data;
  }

  @override
  Widget builder(
    BuildContext context,
    CategorySheetModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
      absorbing: viewModel.isBusy,
      child: FrostedBottomSheet(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    request.title ?? 'Select Category',
                    style: ktsMediumDarkTextStyle(context).copyWith(),
                  ),
                  const Spacer(),
                  // GestureDetector(
                  //   onTap: () => Navigator.of(context).pop(),
                  //   child: Icon(
                  //     Icons.close,
                  //     size: 23,
                  //     color: Theme.of(context).colorScheme.onPrimary,
                  //   ),
                  // )
                ],
              ),
            ),
            verticalSpaceSmall,
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: items
                    .map(
                      (item) => GestureDetector(
                        onTap: () => completer?.call(
                          (SheetResponse(
                            data: item,
                          )),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: appSymmetricEdgePadding,
                              child: SizedBox(
                                width: screenWidth(context),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Row(
                                    children: [
                                      SvgBuilder(
                                        svg: svgsPath +
                                            '/Icons_${item.name}.svg',
                                        height: 30,
                                        color: item.id == request.description
                                            ? kcPrimaryColor
                                            : kcMediumLightGrey,
                                      ),
                                      horizontalSpaceSmall,
                                      Expanded(
                                        child: Text(
                                          item.name,
                                          style: ktsSmall(context).copyWith(
                                            fontSize: 15,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      horizontalSpaceSmall,
                                      if (item.id == request.description)
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            verticalSpaceMedium,
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }

  @override
  CategorySheetModel viewModelBuilder(BuildContext context) =>
      CategorySheetModel(items);
}
