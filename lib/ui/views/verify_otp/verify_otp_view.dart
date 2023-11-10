import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'verify_otp_view.form.dart';
import 'verify_otp_viewmodel.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:flutter/services.dart';

import 'package:stacked/stacked_annotations.dart';

@FormView(
  fields: [
    FormTextField(
      name: "otp",
    ),
  ],
)
class VerifyOtpView extends StackedView<VerifyOtpViewModel>
    with $VerifyOtpView {
  const VerifyOtpView({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;
  @override
  void onDispose(VerifyOtpViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    VerifyOtpViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () {
        viewModel.onBack();
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: IgnorePointer(
            ignoring: viewModel.isBusy,
            child: SingleChildScrollView(
              child: Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  children: [
                    verticalSpaceTiny,
                    Column(
                      children: [
                        _HeaderSection(
                          phoneNumber: phoneNumber,
                        ),
                        verticalSpaceMedium,
                        Padding(
                          padding: appSymmetricEdgePadding,
                          child: Center(
                            child: _BodySection(
                              focusNode: otpFocusNode,
                              verificationController: otpController,
                            ),
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
    );
  }

  @override
  VerifyOtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyOtpViewModel(phoneNumber);
}

class _HeaderSection extends ViewModelWidget<VerifyOtpViewModel> {
  const _HeaderSection({required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context, VerifyOtpViewModel viewModel) {
    return Column(
      children: [
        verticalSpaceMedium,
        verticalSpaceSmall,
        Text(
          'verify_otp'.tr,
          style: ktsBoldMeidumDarkTextStyle(context).copyWith(
            fontSize: 25,
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpaceSmall,
        Text(
          'sent_otp'.tr,
          style: ktsText100(context).copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          phoneNumber,
          style: ktsText100(context).copyWith(
              color: kcDeepBlue,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              decoration: TextDecoration.underline),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _BodySection extends ViewModelWidget<VerifyOtpViewModel> {
  const _BodySection({
    required this.verificationController,
    required this.focusNode,
  });

  final TextEditingController verificationController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, VerifyOtpViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          verticalSpaceSmall,
          _InputField(
            focusNode: focusNode,
            verificationController: verificationController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(0),
                  focusNode: focusNode,
                  code: viewModel.verificationCode(0),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(1),
                  focusNode: focusNode,
                  code: viewModel.verificationCode(1),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(2),
                  focusNode: focusNode,
                  code: viewModel.verificationCode(2),
                ),
              ),
              horizontalSpaceMedium,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(3),
                  focusNode: focusNode,
                  code: viewModel.verificationCode(3),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(4),
                  focusNode: focusNode,
                  code: viewModel.verificationCode(4),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(5),
                  focusNode: focusNode,
                  code: viewModel.verificationCode(5),
                ),
              ),
            ],
          ),
          verticalSpace(32),
          const _BottomSection(),
          if (viewModel.apiValidationMessage != null)
            Column(
              children: <Widget>[
                Text(
                  viewModel.apiValidationMessage!,
                  style: ktsWhiteSmallTextStyle(context)
                      .copyWith(color: Colors.red.withOpacity(0.8)),
                ),
                verticalSpaceSmall,
              ],
            ),
          verticalSpaceSmall,
          AppButton(
            disablebuttonTextStyle: ktsDarkSmall(context).copyWith(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            enabled: viewModel.enableNextButton,
            busy: viewModel.isBusy,
            title: 'verify_otp'.tr,
            onTap: viewModel.onNext,
          ),
          verticalSpace(60),
        ],
      ),
    );
  }
}

class _InputField extends ViewModelWidget<VerifyOtpViewModel> {
  const _InputField(
      {required this.verificationController, required this.focusNode});

  final TextEditingController verificationController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, VerifyOtpViewModel viewModel) {
    return SizedBox(
      height: 0,
      child: InputField(
        autoFocus: true,
        controller: verificationController,
        hasInputDecoration: false,
        onChanged: viewModel.onChange,
        fieldFocusNode: focusNode,
        textStyle: ktsDarkGreyTextStyle(context).copyWith(fontSize: 18),
        placeholder: '',
        textInputType: const TextInputType.numberWithOptions(
            decimal: false, signed: false),
        inputFormatter: [
          FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
          LengthLimitingTextInputFormatter(6),
        ],
      ),
    );
  }
}

class _VerificationInputField extends StatelessWidget {
  const _VerificationInputField({
    required this.code,
    required this.focusNode,
    required this.isBlinking,
  });

  final String code;
  final FocusNode focusNode;
  final bool isBlinking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod("TextInput.show");
        focusNode.requestFocus();
      },
      child: Column(
        children: [
          if (isBlinking)
            BlinkWidget(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 4),
                child: Container(
                  height: 16,
                  width: 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 4),
                child: Container(
                  height: 16,
                  width: 1,
                  alignment: Alignment.center,
                  color: kcTransparent,
                ),
              ),
            ])
          else
            Text(
              code,
              style: ktsSmall(context)
                  .copyWith(fontSize: 16, color: kcPrimaryColor),
            ),
          Container(
            height: isBlinking ? 1.3 : 1,
            width: isBlinking ? 46 : 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                  color: isBlinking
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface),
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomSection extends ViewModelWidget<VerifyOtpViewModel> {
  const _BottomSection();

  @override
  Widget build(BuildContext context, VerifyOtpViewModel viewModel) {
    return viewModel.timeOut
        ? Column(
            children: [
              Text(
                "did_not_receive_code".tr,
                style: ktsText100(context).copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpaceTiny,
              GestureDetector(
                onTap: viewModel.onResendOTP,
                child: Text(
                  "resend".tr,
                  style: ktsText100(context).copyWith(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              verticalSpaceSmall,
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'resend_code'.tr,
                style: ktsText100(context).copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              horizontalSpaceTiny,
              SizedBox(
                width: 70,
                child: CountdownTimer(
                  endTime: (viewModel.now.millisecondsSinceEpoch + 1000 * 60),
                  onEnd: viewModel.onEnTime,
                  widgetBuilder: (_, CurrentRemainingTime? time) {
                    if (time?.sec == null) return const Text('00:00');
                    return Text(
                        '00:${time!.sec! < 10 ? '0' : ''} ${time.sec ?? 00}');
                  },
                  //  onEnd: onEnd,
                ),
              ),
            ],
          );
  }
}

class BlinkWidget extends StatefulWidget {
  final List<Widget> children;
  final int interval;

  const BlinkWidget({
    super.key,
    required this.children,
    this.interval = 400,
  });

  @override
  _BlinkWidgetState createState() => _BlinkWidgetState();
}

class _BlinkWidgetState extends State<BlinkWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentWidget = 0;
  @override
  initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: widget.interval), vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (++_currentWidget == widget.children.length) {
            _currentWidget = 0;
          }
        });

        _controller.forward(from: 0.0);
      }
    });

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.children[_currentWidget],
    );
  }
}
