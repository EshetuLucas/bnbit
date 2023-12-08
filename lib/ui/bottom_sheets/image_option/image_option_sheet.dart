import 'package:bnbit_app/enums/business_image_option.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';

import 'image_option_sheet_model.dart';

import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImageOptionSheet extends StackedView<ImageOptionSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ImageOptionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ImageOptionSheetModel viewModel,
    Widget? child,
  ) {
    return FrostedBottomSheet(
      child: _Header(
        request: request,
        completer: completer,
      ),
    );
  }

  @override
  ImageOptionSheetModel viewModelBuilder(BuildContext context) =>
      ImageOptionSheetModel();
}

class _Header extends ViewModelWidget<ImageOptionSheetModel> {
  const _Header({
    required this.request,
    this.completer,
    Key? key,
  }) : super(key: key);
  final SheetRequest request;
  final Function(SheetResponse)? completer;
  @override
  Widget build(BuildContext context, ImageOptionSheetModel model) {
    return Stack(children: [
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Text(
                request.title ?? 'Business Image',
                style: ktsDarkSmall(context),
              ),
            ),
            verticalSpaceSmall,
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: ActionsItem(
                title: 'View',
                icon: const Icon(
                  Icons.visibility,
                  size: 22,
                ),
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(data: BusinessImageOption.view),
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: appSymmetricEdgePadding,
              child: ActionsItem(
                title: 'Make it cover image',
                icon: const Icon(
                  Icons.image,
                  size: 18,
                ),
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(data: BusinessImageOption.coverImage),
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: appSymmetricEdgePadding,
              child: ActionsItem(
                title: 'Delete',
                icon: const SvgBuilder(
                  svg: trashSvg,
                  color: kcRed,
                ),
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(data: BusinessImageOption.delete),
                ),
              ),
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    ]);
  }
}

class ActionsItem extends StatelessWidget {
  const ActionsItem({
    required this.title,
    required this.icon,
    this.hasTrailingIcon = true,
    this.iconColor = kcPrimaryColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final Widget icon;
  final bool hasTrailingIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      onTap: onTap,
      horizontalTitleGap: 2,
      leading: Padding(padding: const EdgeInsets.only(top: 4), child: icon),
      title: Text(
        title,
        style: ktsSmall(context),
      ),
      trailing: hasTrailingIcon
          ? Icon(
              Icons.navigate_next_sharp,
              color: iconColor,
            )
          : null,
    );
  }
}
