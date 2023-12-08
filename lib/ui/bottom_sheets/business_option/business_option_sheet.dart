import 'package:bnbit_app/enums/business_option.dart';

import 'business_option_sheet_model.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BusinessOptionSheet extends StackedView<BusinessOptionSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const BusinessOptionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BusinessOptionSheetModel viewModel,
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
  BusinessOptionSheetModel viewModelBuilder(BuildContext context) =>
      BusinessOptionSheetModel();
}

class _Header extends ViewModelWidget<BusinessOptionSheetModel> {
  const _Header({
    required this.request,
    this.completer,
    Key? key,
  }) : super(key: key);
  final SheetRequest request;
  final Function(SheetResponse)? completer;
  @override
  Widget build(BuildContext context, BusinessOptionSheetModel model) {
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
                request.title ?? 'Business',
                style: ktsDarkSmall(context),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: ActionsItem(
                title: 'Preview',
                icon: const Icon(
                  Icons.visibility,
                  size: 22,
                ),
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(data: BusinessOption.preview),
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: appSymmetricEdgePadding,
              child: ActionsItem(
                title: 'Manage QR',
                icon: const Icon(Icons.qr_code_outlined),
                hasTrailingIcon: false,
                onTap: () => completer?.call(
                  SheetResponse(data: BusinessOption.qr),
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: appSymmetricEdgePadding,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ActionsItem(
                  title: 'Delete',
                  icon: const SvgBuilder(
                    svg: trashSvg,
                    color: kcRed,
                  ),
                  hasTrailingIcon: false,
                  onTap: () => completer?.call(
                    SheetResponse(data: BusinessOption.delete),
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
