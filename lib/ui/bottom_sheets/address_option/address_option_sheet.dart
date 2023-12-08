import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'address_option_sheet_model.dart';

class AddressOptionSheet extends StackedView<AddressOptionSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddressOptionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddressOptionSheetModel viewModel,
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
  AddressOptionSheetModel viewModelBuilder(BuildContext context) =>
      AddressOptionSheetModel();
}

class _Header extends ViewModelWidget<AddressOptionSheetModel> {
  const _Header({
    required this.request,
    this.completer,
    Key? key,
  }) : super(key: key);
  final SheetRequest request;
  final Function(SheetResponse)? completer;
  @override
  Widget build(BuildContext context, AddressOptionSheetModel model) {
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
                request.title ?? 'Business Address',
                style: ktsDarkSmall(context),
              ),
            ),
            verticalSpaceSmall,
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: ActionsItem(
                title: 'Edit',
                icon: SvgBuilder(
                  svg: editSvg,
                  color: kcDark700Light,
                ),
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(
                    confirmed: true,
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
                title: 'Delete',
                icon: const SvgBuilder(
                  svg: trashSvg,
                  color: kcRed,
                ),
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(
                    confirmed: false,
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
