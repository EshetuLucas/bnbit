import 'dart:io';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/profile_pic_builder.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'edit_profile_view.form.dart';
import 'edit_profile_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "firstName",
    ),
    FormTextField(
      name: "lastName",
    ),
    FormTextField(
      name: "email",
    ),
    FormTextField(
      name: "phoneNumber",
    ),
  ],
)
class EditProfileView extends StackedView<EditProfileViewModel>
    with $EditProfileView {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(EditProfileViewModel viewModel) {
    firstNameController.text = viewModel.firstName;
    lastNameController.text = viewModel.lastName;
    phoneNumberController.text = viewModel.userPhoneNumer;
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(EditProfileViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    EditProfileViewModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
        absorbing: viewModel.isBusy,
        //|| viewModel.isDeletingAccount,
        child: Scaffold(
          bottomNavigationBar: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (viewModel.canChangePassowrdAndEmail)
                  InkWell(
                    onTap: viewModel.onChangePassword,
                    child: Container(
                      width: screenWidth(context),
                      alignment: Alignment.center,
                      color: kcPrimaryColor.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SvgBuilder(
                              svg: lockSvg,
                              color: kcPrimaryColor,
                              height: 15,
                            ),
                            horizontalSpaceSmall,
                            Text(
                              'Change password',
                              style: ktsSemibold(context).copyWith(
                                color: kcPrimaryColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                verticalSpaceTiny,
                InkWell(
                  onTap: viewModel.onDeleteAccount,
                  child: Container(
                    width: screenWidth(context),
                    alignment: Alignment.center,
                    color: kcRed.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SvgBuilder(
                            svg: trashSvg,
                            color: kcRed,
                            height: 15,
                          ),
                          horizontalSpaceSmall,
                          horizontalSpace(2),
                          Text(
                            'Delete account',
                            style: ktsSemibold(context).copyWith(
                              color: kcRed,
                              fontSize: 13,
                            ),
                          ),
                          horizontalSpaceTiny,
                          horizontalSpaceSmall,
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Edit profile',
                ),
                Padding(
                  padding: appSymmetricEdgePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Looks Like you are new here',
                      //   style: ktsSemibold(context)
                      //       .copyWith(color: kcPrimaryColor, fontSize: 15),
                      // ),
                      // Text(
                      //   "Let's create your profile",
                      //   style: ktsSmall(context).copyWith(fontSize: 12),
                      // ),

                      const _UserProfile(),
                      verticalSpaceMedium,

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
                      InputField(
                        controller: phoneNumberController,
                        placeholder:
                            viewModel.isPhoneAuth ? 'Email' : 'Phone Number',
                        labelText:
                            viewModel.isPhoneAuth ? 'Email' : 'Phone Number',
                        textInputType: viewModel.isPhoneAuth
                            ? TextInputType.name
                            : TextInputType.phone,
                        maxLine: 1,
                        hasFocusedBorder: true,
                      ),
                      verticalSpaceSmall,
                      if (viewModel.emailValidation.isNotEmpty) ...[
                        ValidationMessage(title: viewModel.emailValidation),
                      ],

                      verticalSpaceSmall,
                      verticalSpaceMedium,
                      AppButton(
                        enabled: viewModel.hasValidFirstName,
                        busy: viewModel.isBusy,
                        title: 'Save',
                        onTap: () => viewModel.onNext(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  EditProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditProfileViewModel();
}

class _UserProfile extends ViewModelWidget<EditProfileViewModel> {
  const _UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, EditProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _ProfilePic(),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.userFullName,
                style: ktsSmall(context).copyWith(fontSize: 14.5),
              ),
              Text(
                model.userMainAuth,
                style: ktsSmall(context).copyWith(fontSize: 12),
              ),
              verticalSpaceTiny,
            ],
          )
        ],
      ),
    );
  }
}

class _ProfilePic extends ViewModelWidget<EditProfileViewModel> {
  const _ProfilePic({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, EditProfileViewModel viewModel) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        InkWell(
          onTap: viewModel.onAddImage,
          child: ProfilePicBuilder(
            backgroundColor: kcPrimaryColor.withOpacity(0.14),
            url: viewModel.profilePic,
            size: 70,
            textStyle: ktsDarkSmall(context).copyWith(
              fontSize: 24,
              color: kcPrimaryColor,
            ),
          ),
        ),
        if (viewModel.isUploading)
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Image.file(
                  File(viewModel.selectedFile!.path),
                  fit: BoxFit.cover,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) =>
                          frame == null
                              ? Container(
                                  alignment: Alignment.center,
                                  // color: Theme.of(context).colorScheme. primary,
                                  child: Shimmer.fromColors(
                                    baseColor: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.99),
                                    highlightColor:
                                        Theme.of(context).colorScheme.tertiary,
                                    child: const ImageBuilder(
                                      height: 120,
                                      fit: BoxFit.cover,
                                      imagePath: iconImage,
                                    ),
                                    enabled: true,
                                  ),
                                )
                              : child,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                height: 70,
                width: 70,
                child: const Spinner(
                  size: 11,
                ),
              ),
            ],
          ),
        // if (viewModel.user.profile_picture.isNullOrEmpty)
        InkWell(
          onTap: viewModel.addProfilePic,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 20,
              width: 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.camera,
                size: 13,
              ),
            ),
          ),
        )
      ],
    );
  }
}
