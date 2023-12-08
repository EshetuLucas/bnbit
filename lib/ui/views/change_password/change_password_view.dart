import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'change_password_view.form.dart';
import 'change_password_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: "currentPassword"),
    FormTextField(name: "newPassword"),
  ],
)
class ChangePasswordView extends StackedView<ChangePasswordViewModel>
    with $ChangePasswordView {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(ChangePasswordViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(ChangePasswordViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    ChangePasswordViewModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
      absorbing: viewModel.isBusy,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: appSymmetricEdgePadding,
          child: AppButton(
            title: 'Save Changes',
            onTap: viewModel.saveChanges,
            enabled: viewModel.canSaveChanges,
            busy: viewModel.isBusy,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Padding(
            padding: appSymmetricEdgePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  hasPadding: false,
                  title: 'Change Password',
                ),
                verticalSpaceMedium,
                Text(
                  'Current Password',
                  style: ktsSmall(context),
                ),
                verticalSpaceSmall,
                InputField(
                  controller: currentPasswordController,
                  placeholder: 'Enter Current Password',
                  hasFocusedBorder: true,
                  password: true,
                  maxLine: 1,
                ),
                verticalSpaceSmall,
                verticalSpaceTiny,
                Text(
                  'New Password',
                  style: ktsSmall(context),
                ),
                verticalSpaceSmall,
                InputField(
                  controller: newPasswordController,
                  placeholder: 'Enter New Password',
                  hasFocusedBorder: true,
                  password: true,
                  maxLine: 1,
                ),
                verticalSpaceSmall,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    viewModel.validationMessage ?? '',
                    style: ktsSmall(context).copyWith(color: kcRed),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();
}
