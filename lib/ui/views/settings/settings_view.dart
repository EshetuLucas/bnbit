import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_switch.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Settings'),
            verticalSpaceTiny,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Show distance in miles',
                            style: ktsSemibold(context).copyWith(
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          AppSwitch(
                            state: viewModel.isDistanceInMile,
                            onToggle: viewModel.onChangeDistanceSystem,
                          ),
                        ],
                      ),
                      verticalSpace(2),
                      Text(
                        'When turned on: distances will appear in miles; When turrned off: they will be presented in the Metric system',
                        style: ktsSmall(context).copyWith(
                          fontSize: 11,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
