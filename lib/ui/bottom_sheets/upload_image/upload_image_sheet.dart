import 'package:bnbit_app/enums/media_source_type_enum.dart';
import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'upload_image_sheet_model.dart';

class UploadImageSheet extends StackedView<UploadImageSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const UploadImageSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadImageSheetModel viewModel,
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
  UploadImageSheetModel viewModelBuilder(BuildContext context) =>
      UploadImageSheetModel();
}

class _Header extends ViewModelWidget<UploadImageSheetModel> {
  const _Header({
    required this.request,
    this.completer,
    Key? key,
  }) : super(key: key);
  final SheetRequest request;
  final Function(SheetResponse)? completer;
  @override
  Widget build(BuildContext context, UploadImageSheetModel model) {
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
                request.title ?? 'Upload Image',
                style: ktsDarkSmall(context),
              ),
            ),
            verticalSpaceSmall,
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: ActionsItem(
                title: 'Take from camera',
                iconData: CupertinoIcons.camera,
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(
                    data: MediaSourceType.camera_image,
                  ),
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: appSymmetricEdgePadding,
              child: ActionsItem(
                title: 'Select from file',
                iconData: Icons.file_copy,
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(
                    data: MediaSourceType.file,
                  ),
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
    required this.iconData,
    this.hasTrailingIcon = true,
    this.iconColor = kcPrimaryColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final IconData iconData;
  final bool hasTrailingIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      onTap: onTap,
      horizontalTitleGap: 2,
      leading: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Icon(
          iconData,
          size: 18,
        ),
      ),
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
