import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/update_create_business/widgets/address_widget.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/shared_styles.dart';
import '../update_create_business_viewmodel.dart';

class AddressSection extends ViewModelWidget<UpdateCreateBusinessViewModel> {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context, UpdateCreateBusinessViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (viewModel.selectedAddress.isEmpty) ...[
          InkWell(
            onTap: viewModel.onAddAddress,
            child: InputField(
              hintTextStyle: ktsSmall(context),
              placeholder: 'Select Address',
              maxLine: 1,
              hasFocusedBorder: true,
              textInputType: TextInputType.name,
              isReadOnly: viewModel.isBusy,
              suffixIcon: const Padding(
                padding: EdgeInsets.all(18.0),
                child: MoreIcon(),
              ),
            ),
          ),
          if (!viewModel.hasAdress && viewModel.showValidationIfAny) ...[
            const ValidationMessage(title: 'Please add business address'),
            verticalSpaceSmall,
          ],
        ] else
          Column(
            children: [
              ...viewModel.selectedAddress
                  .map(
                    (address) => ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 6),
                          child: DecoratedContainer(
                              onTap: () => viewModel.onAddressTap(address),
                              borderRadius: 10,
                              child: AddressWidget(address: address)),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 4, 6, 0),
                child: SizedBox(
                  width: screenWidth(context),
                  child: DecoratedContainer(
                    onTap: viewModel.onAddAddress,
                    borderRadius: 10,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(' + Add'),
                    ),
                  ),
                ),
              )
            ],
          ),
      ],
    );
  }
}
