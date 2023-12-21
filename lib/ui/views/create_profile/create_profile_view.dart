import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_profile_view.form.dart';
import 'create_profile_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "firstName",
    ),
    FormTextField(
      name: "lastName",
    ),
  ],
)
class CreateProfileView extends StackedView<CreateProfileViewModel>
    with $CreateProfileView {
  const CreateProfileView(
      {Key? key, this.firstName, this.lastName, this.phoneNumber})
      : super(key: key);

  final String? firstName;
  final String? lastName;
  final String? phoneNumber;

  @override
  void onViewModelReady(CreateProfileViewModel viewModel) {
    firstNameController.text = viewModel.firstName;
    lastNameController.text = viewModel.lastName;

    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CreateProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Create your profile',
              hasBackButton: false,
            ),
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Looks Like you are new here',
                    style: ktsSemibold(context)
                        .copyWith(color: kcPrimaryColor, fontSize: 15),
                  ),
                  Text(
                    "Let's create your profile",
                    style: ktsSmall(context).copyWith(
                      fontSize: 12,
                    ),
                  ),
                  verticalSpaceMedium,
                  verticalSpaceSmall,
                  InputField(
                    controller: firstNameController,
                    placeholder: 'First Name',
                    labelText: 'First Name',
                    textInputType: TextInputType.name,
                    maxLine: 1,
                    hasFocusedBorder: true,
                  ),
                  verticalSpaceSmall,
                  verticalSpaceSmall,
                  InputField(
                    controller: lastNameController,
                    placeholder: 'Last Name',
                    labelText: 'Last Name',
                    textInputType: TextInputType.name,
                    maxLine: 1,
                    hasFocusedBorder: true,
                  ),
                  verticalSpaceSmall,
                  verticalSpaceSmall,
                  verticalSpaceMedium,
                  if (viewModel.apiValidation.isNotEmpty) ...[
                    ValidationMessage(title: viewModel.apiValidation),
                    verticalSpaceSmall,
                  ],
                  AppButton(
                    enabled: viewModel.hasValidFirstName,
                    busy: viewModel.isBusy,
                    title: 'Next',
                    onTap: () => viewModel.onNext(phoneNumber),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  CreateProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateProfileViewModel();
}
