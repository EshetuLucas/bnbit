import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/update_create_business/update_create_business_viewmodel.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'section_item_title.dart';
import 'service_item.dart';

class OperatingHours extends ViewModelWidget<UpdateCreateBusinessViewModel> {
  const OperatingHours({
    super.key,
    required this.servicesController,
  });

  final TextEditingController servicesController;

  @override
  Widget build(BuildContext context, UpdateCreateBusinessViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionItemTitle('Operating hours'),
        verticalSpaceTiny,
        if (!viewModel.hasSelectedTradinghours)
          InkWell(
            onTap: viewModel.onOperatingHoursTap,
            child: InputField(
              hintTextStyle: ktsSmall(context),
              placeholder: 'Operating hours',
              maxLine: 1,
              hasFocusedBorder: true,
              textInputType: TextInputType.name,
              isReadOnly: viewModel.isBusy,
              suffixIcon: const Padding(
                padding: EdgeInsets.all(18.0),
                child: MoreIcon(),
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: viewModel.selectedTradingHours.entries
                  .map(
                    (tradingHourEntry) => Column(
                      children: [
                        verticalSpaceSmall,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tradingHourEntry.key,
                              style: ktsSmall(context).copyWith(
                                fontSize: 12,
                                color: kcDarkGrey,
                              ),
                            ),
                            Text(
                              '${tradingHourEntry.value!.startTime.format(context)} - ${tradingHourEntry.value!.endTime.format(context)}',
                              style: ktsSmall(context).copyWith(
                                fontSize: 12,
                                color: kcDarkGrey,
                              ),
                            )
                          ],
                        ),
                        verticalSpaceSmall,
                        const Divider(),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        if (viewModel.hasSelectedTradinghours)
          InkWell(
            onTap: viewModel.onOperatingHoursTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Edit',
                  style: ktsSmall(context)
                      .copyWith(color: kcPrimaryColor, fontSize: 14),
                ),
                horizontalSpaceSmall,
                const SvgBuilder(
                  svg: editSvg,
                  color: kcPrimaryColor,
                ),
              ],
            ),
          ),
        if (viewModel.selectedBusiness != null) ...[
          verticalSpaceSmall,
          const SectionItemTitle('Services'),
          verticalSpaceTiny,
          if (viewModel.services.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 4,
                runSpacing: 6,
                children: viewModel.services
                    .map(
                      (service) => Wrap(
                        spacing: 4,
                        runSpacing: 6,
                        children: [
                          DecoratedContainer(
                            borderRadius: 30,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ServiceItem(service.service),
                                ServiceItem(service.price.toString() +
                                    (service.currency ?? 'ETB')),
                                horizontalSpaceTiny,
                              ],
                            ),
                          ),
                          if (viewModel.isLastService(service))
                            DecoratedContainer(
                              onTap: viewModel.onServicesTap,
                              borderRadius: 30,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Text(' + Add'),
                              ),
                            )
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
          else
            InkWell(
              onTap: viewModel.onServicesTap,
              child: InputField(
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: MoreIcon(),
                ),
                placeholder: 'Add services',
                maxLine: 1,
                hasFocusedBorder: true,
                textInputType: TextInputType.name,
                isReadOnly: viewModel.isBusy,
              ),
            ),
        ]
      ],
    );
  }
}
