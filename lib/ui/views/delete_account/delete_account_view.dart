import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'delete_account_viewmodel.dart';

class DeleteAccountView extends StackedView<DeleteAccountViewModel> {
  const DeleteAccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteAccountViewModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
      absorbing: viewModel.isBusy,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Delete Account',
              ),
              verticalSpaceMedium,
              Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: SvgBuilder(
                        svg: trashSvg,
                        height: 40,
                      ),
                    ),
                    verticalSpaceMedium,
                    Text(
                      'Are you sure you want to delete?',
                      style: ktsSemibold(context)
                          .copyWith(color: kcDark, fontSize: 16),
                    ),
                    verticalSpaceTiny,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'This action is irreversible and will permanently remove all your data associated with this account.',
                        style: ktsSemibold(context)
                            .copyWith(color: kcDark700, fontSize: 14),
                      ),
                    ),
                    verticalSpaceMedium,
                    Row(
                      children: [
                        horizontalSpaceSmall,
                        Expanded(
                          child: AppButton(
                            height: 45,
                            title: 'Cancel',
                            onTap: () => Navigator.of(context).pop(),
                          ),
                        ),
                        horizontalSpaceSmall,
                        Expanded(
                          child: AppButton(
                              // isOutlined: true,
                              height: 45,
                              backgroundColor: kcRed.withOpacity(0.3),
                              textColor: kcRed,
                              title: 'Delete',
                              onTap: viewModel.reAuthUser),
                        ),
                        horizontalSpaceSmall,
                      ],
                    ),
                    verticalSpaceMedium,
                    if (viewModel.isBusy) ...[
                      const SizedBox(
                        height: 40,
                        child: Spinner(),
                      ),
                      verticalSpaceTiny,
                      Text(
                        'Please wait',
                        style: ktsSemibold(context)
                            .copyWith(color: kcDark700, fontSize: 13),
                      )
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  DeleteAccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DeleteAccountViewModel();
}
