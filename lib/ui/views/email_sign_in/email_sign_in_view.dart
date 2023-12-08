import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/validation_text_widget.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'email_sign_in_viewmodel.dart';
import 'package:bnbit_app/ui/views/email_sign_in/email_sign_in_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: "email",
    ),
    FormTextField(
      name: "confirmPassword",
    ),
    FormTextField(
      name: "password",
    ),
  ],
)
class EmailSignInView extends StackedView<EmailSignInViewModel>
    with $EmailSignInView {
  EmailSignInView({
    Key? key,
  }) : super(key: key);

  @override
  void onViewModelReady(EmailSignInViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(EmailSignInViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  Widget builder(context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: AbsorbPointer(
              absorbing: viewModel.isBusy,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const _HeaderSection(),
                            verticalSpaceMedium,
                            _BodySection(
                              emailController: emailController,
                              passwordController: passwordController,
                              confirmPasswordController:
                                  confirmPasswordController,
                            ),
                            const _BottomSection(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  @override
  EmailSignInViewModel viewModelBuilder(BuildContext context) =>
      EmailSignInViewModel();
}

class _BottomSection extends ViewModelWidget<EmailSignInViewModel> {
  const _BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, EmailSignInViewModel viewModel) {
    return Column(
      children: [
        verticalSpace(20),
        Padding(
          padding: appSymmetricEdgePadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                !viewModel.isCreateAccount
                    ? "Don't have an account?"
                    : 'Already have an acccount',
                style: ktsSmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: kcDark.withOpacity(0.9),
                ),
              ),
              TextButton(
                onPressed: viewModel.setCreateAccountValue,
                child: Text(
                  !viewModel.isCreateAccount ? 'Sign Up' : 'Login using email',
                  style: ktsDarkSmall(context).copyWith(
                      fontWeight: FontWeight.w600, color: kcPrimaryColor),
                ),
              )
            ],
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}

class _BodySection extends ViewModelWidget<EmailSignInViewModel> {
  const _BodySection({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context, EmailSignInViewModel viewModel) {
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputField(
              controller: emailController,
              maxLine: 1,
              hasFocusedBorder: true,
              textInputType: TextInputType.emailAddress,
              isReadOnly: viewModel.isBusy,
              nextFocusNode: FocusScope.of(context),
              placeholder: 'Email',
              onChanged: (_) => viewModel.setEmailValidation(''),
            ),
            verticalSpaceSmall,
            InputField(
              password: true,
              maxLine: 1,
              hasFocusedBorder: true,
              isReadOnly: viewModel.isBusy,
              controller: passwordController,
              placeholder: 'Password',
              nextFocusNode: FocusScope.of(context),
              onChanged: (_) => viewModel.setPasswordValidation(''),
            ),
            if (viewModel.isCreateAccount) ...[
              verticalSpaceSmall,
              InputField(
                password: true,
                maxLine: 1,
                hasFocusedBorder: true,
                isReadOnly: viewModel.isBusy,
                controller: confirmPasswordController,
                placeholder: 'Confirm Password',
                nextFocusNode: FocusScope.of(context),
                onChanged: (_) => viewModel.setPasswordValidation('',
                    isConfirmPassword: true),
              ),
            ],
            if (!viewModel.isCreateAccount) ...[
              verticalSpace(19),
              Row(
                children: [
                  horizontalSpace(8),
                  const Spacer(),
                  GestureDetector(
                    onTap: viewModel.onForgotPassword,
                    child: Text(
                      'Forgot Password?',
                      style: ktsDarkSmall(context).copyWith(
                          fontWeight: FontWeight.w600, color: kcPrimaryColor),
                    ),
                  )
                ],
              ),
            ],
            verticalSpace(30),
            if (viewModel.passwordValidation.isNotEmpty)
              ValidationText(
                title: viewModel.passwordValidation,
              ),
            verticalSpace(10),
            if (viewModel.emailValidation.isNotEmpty)
              ValidationText(
                title: viewModel.emailValidation,
              ),
            if (viewModel.apiErrorMessage.isNotEmpty) ...[
              ValidationText(
                title: viewModel.apiErrorMessage,
              ),
              verticalSpaceSmall,
            ],
            AppButton(
              title: viewModel.isCreateAccount ? 'Sign Up' : 'Login',
              busy: viewModel.isBusy,
              onTap: () {
                FocusScope.of(context).unfocus();
                viewModel.loginWithEmail();
              },
              enabled: !viewModel.isBusy,
            )
          ]),
    );
  }
}

class _HeaderSection extends ViewModelWidget<EmailSignInViewModel> {
  const _HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, EmailSignInViewModel viewModel) {
    return Stack(
      children: [
        Column(
          children: [
            const Row(
              children: [
                SizedBox(
                  height: 45,
                  width: 100,
                ),
                Spacer(),
              ],
            ),
            verticalSpaceMedium,
            const ImageBuilder(
              imagePath: iconImage,
              height: 40,
            ),
            verticalSpaceSmall,
            Text(
              'Welcome',
              style: ktsSemibold(context)
                  .copyWith(fontSize: 21, color: kcPrimary2Color),
            ),
            verticalSpaceTiny,
            Text(
              'Enter your Email address ',
              style: ktsText100(context).copyWith(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 14),
            ),
          ],
        ),
        InkWell(
          onTap: viewModel.onClose,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kcPrimaryColor.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.close,
                color: kcPrimaryColor.withOpacity(0.6),
              ),
            ),
          ),
        )
      ],
    );
  }
}
