import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../widgets/sociallogin_widget.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';
import 'package:get/get.dart';

@FormView(
  fields: [
    FormTextField(
      name: "phoneNumber",
    ),
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (model) {
        phoneNumberController.clear();
      },
      builder: (context, model, child) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanDown: (_) {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
                  child: Text(
                    '@2023 - Bnbit',
                    style: ktsDarkGreyTextStyle(context).copyWith(fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              body: SafeArea(
                child: IgnorePointer(
                  ignoring: model.isBusy,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: appSymmetricEdgePadding,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const _HeaderSection(),
                              verticalSpaceSmall,
                              verticalSpace(4),
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpaceSmall,
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: model.onChangeCountry,
                                          child: SizedBox(
                                            height: 50,
                                            width: 100,
                                            child: AbsorbPointer(
                                              absorbing: true,
                                              child: InputField(
                                                fieldHeight: 48,
                                                prefixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    top: 12,
                                                    bottom: 12,
                                                    right: 10,
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(
                                                          'assets/flags/' +
                                                              model
                                                                  .selectedCountry
                                                                  .flag,
                                                          width: 24,
                                                        ),
                                                        horizontalSpaceSmall,
                                                        FittedBox(
                                                          child: Text(
                                                            model
                                                                .selectedCountry
                                                                .dialCode,
                                                            style:
                                                                ktsDarkGreyTextStyle(
                                                                        context)
                                                                    .copyWith(
                                                                        fontSize:
                                                                            15),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                controller:
                                                    phoneNumberController,
                                                maxLine: 1,
                                                hasFocusedBorder: true,
                                                isReadOnly: model.isBusy,
                                                placeholder: 'Phone Number',
                                              ),
                                            ),
                                          ),
                                        ),
                                        horizontalSpaceTiny,
                                        Flexible(
                                          child: InputField(
                                            fieldHeight: 48,
                                            controller: phoneNumberController,
                                            maxLine: 1,
                                            hasFocusedBorder: true,
                                            textInputType: TextInputType.phone,
                                            isReadOnly: model.isBusy,
                                            nextFocusNode:
                                                FocusScope.of(context),
                                            placeholder: 'Phone Number',
                                          ),
                                        )
                                      ],
                                    ),
                                    if (model.phoneNumberValidationMessage
                                        .isNotEmpty)
                                      ValidationMessage(
                                        title:
                                            model.phoneNumberValidationMessage,
                                      ),
                                    verticalSpaceMedium,
                                    verticalSpaceSmall,
                                    if (model.apiValidationMessage != null)
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            model.apiValidationMessage!,
                                            style:
                                                ktsWhiteSmallTextStyle(context)
                                                    .copyWith(
                                                        color: Colors.red
                                                            .withOpacity(0.8)),
                                          ),
                                          verticalSpaceSmall,
                                        ],
                                      ),
                                    AppButton(
                                      title: 'Send OTP'.tr,
                                      busy: model.isBusy,
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        model.login();
                                      },
                                      enabled: !model.isBusy,
                                    ),
                                    verticalSpaceMedium,
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 20),
                                      child: SizedBox(
                                        height: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                width: 100,
                                                child: Divider(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiaryContainer,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text('Or continue with',
                                                style:
                                                    ktsSmall(context).copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: 100,
                                                child: Divider(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiaryContainer,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SocialloginWidget(
                                          onEmailSign: model.onEmailSignIn,
                                          onGoogleSign: model.signInWithGoogle,
                                          onAppleSign:
                                              model.useAppleAuthentication,
                                          isAppleSignInAvailable:
                                              model.isAppleSignInAvailable,
                                        ),
                                        verticalSpaceSmall,
                                        if (model.isBusy)
                                          Container(
                                            alignment: Alignment.center,
                                            height: 22,
                                            child: const Spinner(
                                              size: 13,
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpaceSmall,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HeaderSection extends ViewModelWidget<LoginViewModel> {
  const _HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(
              height: 45,
              width: 100,
              // child: SvgBuilder(
              //   svg: bnbit_app,
              //   height: 60,
              // ),
            ),
            // Text(
            //   'bnbit_app',
            //   style: ktsBoldTextStyle.copyWith(
            //     fontSize: 22,
            //     color: Theme.of(context).colorScheme. primary,
            //   ),
            // ),
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
          'Enter your Phone Number',
          style: ktsText100(context).copyWith(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 14),
        ),
      ],
    );
  }
}
