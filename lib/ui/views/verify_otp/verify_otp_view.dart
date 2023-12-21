import 'package:bnbit_app/ui/widgets/numeric_keyboard.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'verify_otp_viewmodel.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';

class VerifyOtpView extends StackedView<VerifyOtpViewModel> {
  const VerifyOtpView({
    Key? key,
    required this.phoneNumber,
    this.password,
    this.isNewUser = true,
  }) : super(key: key);

  final String phoneNumber;
  final String? password;
  final bool isNewUser;

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
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: 220,
            width: screenWidth(context),
            child: Padding(
              padding: appSymmetricEdgePadding,
              child: NumericKeyboard(
                textColor: kcDark,
                onKeyboardTap: viewModel.onKeyboardTap,
                rightIcon: Icon(
                  Icons.backspace,
                  color: kcDark700,
                ),
                rightButtonFn: viewModel.onClearKeyboard,
              ),
            ),
          ),
        ),
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
                            child: _BodySection(),
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
      VerifyOtpViewModel(phoneNumber, password, isNewUser);
}

class _HeaderSection extends ViewModelWidget<VerifyOtpViewModel> {
  const _HeaderSection({required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context, VerifyOtpViewModel viewModel) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              verticalSpaceMedium,
              verticalSpaceSmall,
              Text(
                'Verify OTP'.tr,
                style: ktsBoldMeidumDarkTextStyle(context).copyWith(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpaceSmall,
              Text(
                'We have sent otp to this'.tr,
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
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
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
          ),
        )
      ],
    );
  }
}

class _BodySection extends ViewModelWidget<VerifyOtpViewModel> {
  const _BodySection();

  @override
  Widget build(BuildContext context, VerifyOtpViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(0),
                  code: viewModel.verificationCode(0),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(1),
                  code: viewModel.verificationCode(1),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(2),
                  code: viewModel.verificationCode(2),
                ),
              ),
              horizontalSpaceMedium,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(3),
                  code: viewModel.verificationCode(3),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(4),
                  code: viewModel.verificationCode(4),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _VerificationInputField(
                  isBlinking: viewModel.isBlinking(5),
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
            title: 'Verify Otp'.tr,
            onTap: viewModel.onNext,
          ),
          verticalSpace(60),
        ],
      ),
    );
  }
}

class _VerificationInputField extends StatelessWidget {
  const _VerificationInputField({
    required this.code,
    required this.isBlinking,
  });

  final String code;
  final bool isBlinking;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
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
            style:
                ktsSmall(context).copyWith(fontSize: 16, color: kcPrimaryColor),
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
                "Did not receive code".tr,
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
                  "Resend".tr,
                  style: ktsText100(context).copyWith(
                    decoration: TextDecoration.underline,
                    color: kcPrimaryColor,
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
                'Resend code in ',
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
