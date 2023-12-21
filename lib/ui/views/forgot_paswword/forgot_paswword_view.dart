import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/validation_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'forgot_paswword_view.form.dart';
import 'forgot_paswword_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "email",
    ),
  ],
)
class ForgotPasswordView extends StackedView<ForgotPasswordViewModel>
    with $ForgotPasswordView {
  ForgotPasswordView({Key? key}) : super(key: key);
  final scaffold = GlobalKey<ScaffoldState>();

  @override
  void onViewModelReady(ForgotPasswordViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(ForgotPasswordViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Reset password'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BodySection(emailController),
                  const _BottomSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotPasswordViewModel();
}

class _BottomSection extends ViewModelWidget<ForgotPasswordViewModel> {
  const _BottomSection();

  @override
  Widget build(BuildContext context, ForgotPasswordViewModel viewModel) {
    return GestureDetector(
      onTap: viewModel.onBackToLoginTextTap,
      child: Text(
        'Back to Login',
        style: ktsDarkSmall(context).copyWith(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _BodySection extends ViewModelWidget<ForgotPasswordViewModel> {
  const _BodySection(this.emailController);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context, ForgotPasswordViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        Text(
          'Forgot Password',
          style: ktsSemiboldBlack(context).copyWith(
            fontSize: 23,
          ),
        ),
        Text(
          'No worries, we’ll send you reset instructions',
          style: ktsDarkSmall(context).copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ),
        verticalSpace(35),
        if (viewModel.emailValidation.isNotEmpty) ...[
          ValidationText(
            title: viewModel.emailValidation,
          ),
          verticalSpaceSmall,
        ],
        InputField(
          labelText: 'Email',
          isReadOnly: viewModel.isBusy,
          placeholder: '',
          controller: emailController,
          onChanged: (_) => viewModel.setEmailValidation(''),
          hasFocusedBorder: true,
          textInputType: TextInputType.emailAddress,
        ),
        verticalSpace(30),
        AppButton(
          busy: viewModel.isBusy,
          title: 'Reset Password',
          onTap: viewModel.onRestPasswordButtonTap,
        ),
        verticalSpace(38),
      ],
    );
  }
}
