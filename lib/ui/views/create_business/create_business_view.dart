import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_business_view.form.dart';
import 'create_business_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "name",
    ),
    FormTextField(
      name: "description",
    ),
    FormTextField(
      name: "email",
    ),
    FormTextField(
      name: "webiste",
    ),
    FormTextField(
      name: "instagram",
    ),
    FormTextField(
      name: "telegram",
    ),
    FormTextField(
      name: "phone",
    ),
  ],
)
class CreateBusinessView extends StackedView<CreateBusinessViewModel>
    with $CreateBusinessView {
  const CreateBusinessView({Key? key}) : super(key: key);
  @override
  void onViewModelReady(CreateBusinessViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CreateBusinessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: AppButton(
            title: 'Create Business',
            onTap: viewModel.onCreateBusiness,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Create Business',
            ),
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add your business detail',
                    style: ktsSmall(context).copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: kcDark700),
                  ),
                  verticalSpaceSmall,
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Name',
                    labelText: 'Name *',

                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                  ),
                  verticalSpaceSmall,
                  if (viewModel.hasNoValidName) ...[
                    ValidationMessage(title: viewModel.nameValidationMessage),
                    verticalSpaceSmall,
                  ],
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Description',
                    labelText: 'Description *',

                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                  ),
                  verticalSpaceSmall,
                  verticalSpaceSmall,
                  Text(
                    'Business address & Categories',
                    style: ktsSmall(context).copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: kcDark700),
                  ),
                  verticalSpaceSmall,
                  verticalSpace(2),
                  InputField(
                    placeholder: 'Select Adress',

                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: MoreIcon(),
                    ),
                  ),
                  verticalSpaceSmall,
                  if (viewModel.hasNoValidName) ...[
                    ValidationMessage(title: viewModel.nameValidationMessage),
                    verticalSpaceSmall,
                  ],
                  InputField(
                    placeholder: 'Select Category',

                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: MoreIcon(),
                    ),
                  ),
                  verticalSpaceSmall,
                  verticalSpaceSmall,
                  Text(
                    'Ways for people to reach you',
                    style: ktsSmall(context).copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: kcDark700),
                  ),
                  verticalSpaceSmall,
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Phone Number ',
                    labelText: 'Phone Number (optional)',

                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                  ),
                  verticalSpaceSmall,
                  verticalSpaceTiny,
                  InputField(
                    placeholder: 'Email',
                    labelText: 'Email (optional)',
                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                  ),
                  verticalSpaceSmall,
                  verticalSpaceTiny,
                  InputField(
                    placeholder: 'Website',
                    labelText: 'Website (optional)',

                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                  ),
                  verticalSpaceSmall,
                  verticalSpaceTiny,
                  InputField(
                    placeholder: 'Instagram',
                    labelText: 'Instagram (optional)',

                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                  ),
                  verticalSpaceSmall,
                  verticalSpaceTiny,
                  InputField(
                    placeholder: 'Telegram',
                    labelText: 'Telegram (optional)',

                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.name,
                    isReadOnly: viewModel.isBusy,
                    controller: nameController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CreateBusinessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateBusinessViewModel();
}
