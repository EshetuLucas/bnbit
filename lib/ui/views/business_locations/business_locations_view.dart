import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'business_locations_view.form.dart';
import 'business_locations_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "place",
    ),
    FormTextField(
      name: "phoneNumber",
    ),
    FormTextField(
      name: "lable",
    ),
  ],
)
class BusinessLocationsView extends StackedView<BusinessLocationsViewModel>
    with $BusinessLocationsView {
  const BusinessLocationsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BusinessLocationsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: AppButton(
              enabled: viewModel.hasAddress,
              title: 'Confirm',
              onTap: viewModel.onDone,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Add business locations',
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.address.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return verticalSpace(18);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final address = viewModel.address[index];
                        return _Location(
                          phoneNumberController: phoneNumberController,
                          lableController: lableController,
                          title: 'Location ${index + 1}',
                          index: index + 1,
                          onTap: () => viewModel.onAddAddress(
                            index,
                          ),
                          address: address,
                          onRemove: () => viewModel.onRemove(index),
                        );
                      },
                    ),
                    verticalSpace(18),
                    _Location(
                      phoneNumberController: phoneNumberController,
                      lableController: lableController,
                      title: 'Add location ${viewModel.address.length + 1}',
                      index: viewModel.address.length + 1,
                      onTap: () =>
                          viewModel.onAddAddress(viewModel.address.length),
                      address: viewModel.placeHolderAddress,
                    ),
                    verticalSpaceLarge,
                    verticalSpaceLarge,
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  BusinessLocationsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BusinessLocationsViewModel();
}

class _Location extends ViewModelWidget<BusinessLocationsViewModel> {
  const _Location({
    this.onTap,
    required this.index,
    required this.address,
    required this.title,
    required this.phoneNumberController,
    required this.lableController,
    this.onRemove,
  });

  final int index;
  final Address address;
  final VoidCallback? onTap;
  final String title;
  final VoidCallback? onRemove;
  final TextEditingController phoneNumberController;
  final TextEditingController lableController;

  @override
  Widget build(BuildContext context, BusinessLocationsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: ktsSmallTitle(context),
            ),
            const Spacer(),
            if (onRemove != null)
              InkWell(
                onTap: onRemove,
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: kcRed,
                ),
              )
          ],
        ),
        verticalSpaceSmall,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: onTap,
                child: InputField(
                  placeholder: address.city == 'Select Location'
                      ? address.city
                      : address.displayAddress,

                  maxLine: 1,
                  // onChanged: viewModel.onChange,
                  hasFocusedBorder: true,
                  textInputType: TextInputType.name,

                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SvgBuilder(svg: locationSvg),
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: MoreIcon(),
                  ),
                ),
              ),
            ),
            if (address.city != 'Select Location') ...[
              verticalSpaceSmall,
              verticalSpaceTiny,
              InkWell(
                onTap: () => viewModel.onAddOtherDetails(
                  'Phone Number',
                  index - 1,
                  description: address.phone_number,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InputField(
                    //controller: phoneNumberController,
                    placeholder: address.phone_number ?? 'Phone Number ',
                    labelText: 'Phone Number *',
                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.phone,
                  ),
                ),
              ),
              verticalSpaceSmall,
              verticalSpaceTiny,
              InkWell(
                onTap: () => viewModel.onAddOtherDetails(
                  'Label',
                  index - 1,
                  description: address.label,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InputField(
                    placeholder: address.label ?? 'Example building 3 floor',
                    labelText: 'Custom Address name (optional)',
                    maxLine: 1,
                    // onChanged: viewModel.onChange,
                    hasFocusedBorder: true,
                    textInputType: TextInputType.phone,
                  ),
                ),
              )
            ],
          ],
        ),
      ],
    );
  }
}
