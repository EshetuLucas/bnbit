import 'package:bnbit_app/data_model/time_range/time_range.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/app_switch.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'set_trading_hours_viewmodel.dart';

class SetScheduleView extends StackedView<SetScheduleViewModel> {
  final Map<String, TimeRange?>? tradingHours;
  const SetScheduleView({
    Key? key,
    this.tradingHours,
  }) : super(key: key);

  @override
  void onViewModelReady(SetScheduleViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.setExistingSchedule(tradingHours);
  }

  @override
  Widget builder(
    BuildContext context,
    SetScheduleViewModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
      absorbing: viewModel.isBusy,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(24),
          child: AppButton(
            busy: viewModel.isBusy,
            title: 'Done',
            onTap: viewModel.onDoneTapped,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Operating hours',
                hasPadding: true,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    Text(
                      'Set for range',
                      style: ktsBoldTextStyle(context).copyWith(
                        color: kcPrimaryColor,
                      ),
                    ),
                    verticalSpaceSmall,
                    ...viewModel.combinedTradingHours.entries.map(
                      (entry) => _TradingHoursToggle(
                        title: entry.key,
                        onToggleTapped: () =>
                            viewModel.toggleCombinedTradingHours(
                          entry.key,
                        ),
                        timeRange: entry.value,
                        onFromTimeTapped: () =>
                            viewModel.selectStartTimeForCombinedHours(
                          key: entry.key,
                          currentTimeRange: entry.value!,
                        ),
                        onToTimeTapped: () =>
                            viewModel.selectEndTimeForCombinedHours(
                          key: entry.key,
                          currentTimeRange: entry.value!,
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    if (!viewModel.hasAnyCombinedValue)
                      Text(
                        'Set for each day',
                        style: ktsBoldTextStyle(context)
                            .copyWith(color: kcPrimaryColor),
                      ),
                    verticalSpaceSmall,
                    if (!viewModel.hasAnyCombinedValue)
                      ...viewModel.dailyTradingHours.entries.map(
                        (entry) => _TradingHoursToggle(
                          title: entry.key,
                          onToggleTapped: () =>
                              viewModel.toggleDailyTradingHours(
                            entry.key,
                          ),
                          timeRange: entry.value,
                          onFromTimeTapped: () =>
                              viewModel.selectStartTimeForDailyHours(
                            key: entry.key,
                            currentTimeRange: entry.value!,
                          ),
                          onToTimeTapped: () =>
                              viewModel.selectEndTimeForDailyHours(
                            key: entry.key,
                            currentTimeRange: entry.value!,
                          ),
                        ),
                      ),
                    verticalSpaceLarge,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SetScheduleViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SetScheduleViewModel();
}

class _TradingHoursToggle extends StatelessWidget {
  final String title;
  final TimeRange? timeRange;
  final void Function()? onToggleTapped;
  final void Function()? onFromTimeTapped;
  final void Function()? onToTimeTapped;
  const _TradingHoursToggle({
    Key? key,
    required this.title,
    this.timeRange,
    this.onFromTimeTapped,
    this.onToTimeTapped,
    this.onToggleTapped,
  }) : super(key: key);

  bool get _hasTimeRange => timeRange != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceSmall,
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: !_hasTimeRange
                  ? ktsSemibold300(context).copyWith(fontSize: 13)
                  : ktsSemibold300(context)
                      .copyWith(color: kcPrimaryColor, fontSize: 13),
            ),
            AppSwitch(
              onToggle: (value) => onToggleTapped?.call(),
              state: _hasTimeRange,
            ),
          ],
        ),
        verticalSpaceSmall,
        if (_hasTimeRange)
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TimeSelectionItem(
                title: 'From',
                time: timeRange!.startTime,
                onTap: onFromTimeTapped,
              ),
              horizontalSpaceMedium,
              _TimeSelectionItem(
                title: 'To',
                time: timeRange!.endTime,
                onTap: onToTimeTapped,
              ),
            ],
          ),
        verticalSpaceSmall,
        const Divider(),
      ],
    );
  }
}

class _TimeSelectionItem extends StatelessWidget {
  final String title;
  final TimeOfDay time;
  final void Function()? onTap;

  const _TimeSelectionItem({
    Key? key,
    required this.title,
    required this.time,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          verticalSpaceSmall,
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 16,
                top: 11,
                bottom: 11,
              ),
              child: Text(
                time.format(context),
                style: ktsSmall(context).copyWith(fontSize: 12),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: kcBorderColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
