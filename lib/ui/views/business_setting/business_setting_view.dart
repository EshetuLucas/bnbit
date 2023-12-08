import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'business_setting_viewmodel.dart';

class BusinessSettingView extends StackedView<BusinessSettingViewModel> {
  const BusinessSettingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BusinessSettingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  BusinessSettingViewModel viewModelBuilder(
    BuildContext context,
  ) => BusinessSettingViewModel();
}
