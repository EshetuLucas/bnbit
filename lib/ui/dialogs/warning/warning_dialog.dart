import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/dialogs/basic_dialog.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'warning_dialog_model.dart';

class WarningDialog extends StackedView<WarningDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const WarningDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WarningDialogModel viewModel,
    Widget? child,
  ) {
    return BasicDialog(
      child: Padding(
        padding: appSymmetricEdgePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceTiny,
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: SvgBuilder(
                    svg: logOutSvg,
                    color: kcRed,
                    height: 18,
                  ),
                ),
                horizontalSpaceSmall,
                Text(
                  request.title ?? 'Log out',
                  style: ktsSmall(context).copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close))
              ],
            ),
            verticalSpaceSmall,
            verticalSpaceSmall,
            Text(
              request.description ?? 'Are you sure you want to logout ?',
              textAlign: TextAlign.center,
              style: ktsSmall(context).copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            verticalSpaceMedium,
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 100,
                    height: 32,
                    child: AppButton(
                      height: 32,
                      title: request.mainButtonTitle ?? 'No',
                      fontSize: 13,
                      onTap: () => completer.call(
                        DialogResponse(
                          confirmed: false,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpaceSmall,
                  SizedBox(
                    width: 100,
                    height: 32,
                    child: AppButton(
                      isOutlined: true,
                      backgroundColor: Theme.of(context).colorScheme.outline,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      height: 32,
                      title: request.mainButtonTitle ?? 'Yes',
                      fontSize: 13,
                      onTap: () => completer.call(
                        DialogResponse(
                          confirmed: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall
          ],
        ),
      ),
    );
  }

  @override
  WarningDialogModel viewModelBuilder(BuildContext context) =>
      WarningDialogModel();
}
