import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/dialogs/basic_dialog.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'forgot_password_dialog_model.dart';

class ForgotPasswordDialog extends StackedView<ForgotPasswordDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ForgotPasswordDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordDialogModel viewModel,
    Widget? child,
  ) {
    return BasicDialog(
      onCloseTap: () => Navigator.pop(context),
      padding: const EdgeInsets.fromLTRB(50, 60, 50, 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SvgBuilder(
            svg: smileyFace,
            color: kcPrimaryColor,
            width: 50,
            height: 60,
          ),
          verticalSpace(16),
          Text(
            request.title ?? 'Reset password link sent to your email ',
            textAlign: TextAlign.center,
            style: ktsHeading900(context).copyWith(
              fontWeight: FontWeight.w700,
              color: kcPrimaryColor,
              fontSize: 20,
            ),
          ),
          verticalSpace(11),
          Text(
            request.description ??
                'Please check your email to reset password. And Login again with your new password',
            textAlign: TextAlign.center,
            style: ktsSmall(context).copyWith(
              color: kcDark,
              fontSize: 14,
            ),
          ),
          verticalSpace(40),
          AppButton(
            title: 'Got it!',
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  @override
  ForgotPasswordDialogModel viewModelBuilder(BuildContext context) =>
      ForgotPasswordDialogModel();
}
