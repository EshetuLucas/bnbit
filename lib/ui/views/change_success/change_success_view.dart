import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'change_success_viewmodel.dart';

class ChangeSuccessView extends StackedView<ChangeSuccessViewModel> {
  final String image;
  final String title;
  final String subtitle;
  const ChangeSuccessView({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangeSuccessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: AppButton(
          title: 'Back to home',
          onTap: viewModel.navigateToHome,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          children: [
            verticalSpaceMassive,
            Image.asset(
              image,
              fit: BoxFit.contain,
              height: screenHeightFraction(context, dividedBy: 4),
              width: screenWidth(context),
            ),
            verticalSpaceSmall,
            Text(
              title,
              style: ktsLightGreyMeidumTextStyle(context),
              textAlign: TextAlign.center,
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                subtitle,
                style: ktsBoldMeidumDarkTextStyle(context).copyWith(
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChangeSuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangeSuccessViewModel();
}
