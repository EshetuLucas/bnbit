import 'dart:developer';

import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'input_field_sheet.form.dart';
import 'input_field_sheet_model.dart';

@FormView(
  fields: [
    FormTextField(
      name: "input",
    ),
    FormTextField(
      name: "price",
    ),
    FormTextField(
      name: "currency",
    ),
  ],
)
class InputFieldSheet extends StackedView<InputFieldSheetModel>
    with $InputFieldSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const InputFieldSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);
  @override
  void onViewModelReady(InputFieldSheetModel viewModel) {
    syncFormWithViewModel(viewModel);

    if (request.data != null) {
      priceController.text = request.data!.price.toString();
      inputController.text = request.data!.service.toString();
      currencyController.text = request.data!.currency.toString();
    }
    super.onViewModelReady(viewModel);
  }
  //1000141321138

  @override
  void onDispose(InputFieldSheetModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    InputFieldSheetModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
      absorbing: viewModel.isBusy,
      child: FrostedBottomSheet(
        child: SafeArea(
          child: Padding(
            padding: appSymmetricEdgePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpaceSmall,
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Service',
                      style: ktsMediumDarkTextStyle(context).copyWith(),
                    ),
                    const Spacer(),
                    // GestureDetector(
                    //   onTap: () => Navigator.of(context).pop(),
                    //   child: Icon(
                    //     Icons.close,
                    //     size: 23,
                    //     color: Theme.of(context).colorScheme.onPrimary,
                    //   ),
                    // )
                  ],
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: request.data?.service ?? '',
                  labelText: 'Service',
                  maxLine: 1,
                  autoFocus: true,
                  onChanged: (_) => viewModel.setServiceValidation(''),
                  hasFocusedBorder: true,
                  textInputType: TextInputType.text,
                  isReadOnly: viewModel.isBusy,
                  controller: inputController,
                ),
                if (viewModel.serviceValidationMessage.isNotEmpty) ...[
                  ValidationMessage(title: viewModel.serviceValidationMessage),
                  verticalSpaceSmall,
                ],
                verticalSpaceMedium,
                InputField(
                  placeholder:
                      request.data != null && request.data?.price != null
                          ? request.data!.price.toString()
                          : 'Price',
                  labelText: 'Price',
                  maxLine: 1,
                  autoFocus: true,
                  onChanged: (_) => viewModel.setPriceValidation(''),
                  hasFocusedBorder: true,
                  textInputType: TextInputType.number,
                  isReadOnly: viewModel.isBusy,
                  controller: priceController,
                ),
                verticalSpaceMedium,
                InputField(
                  placeholder:
                      request.data != null && request.data?.currency != null
                          ? request.data!.currency.toString()
                          : 'ETB',
                  labelText: 'Currency',
                  maxLine: 1,
                  autoFocus: true,
                  onChanged: (_) => viewModel.setPriceValidation(''),
                  hasFocusedBorder: true,
                  textInputType: TextInputType.text,
                  isReadOnly: viewModel.isBusy,
                  controller: currencyController,
                ),
                if (viewModel.currencyValidationMessage.isNotEmpty) ...[
                  ValidationMessage(title: viewModel.currencyValidationMessage),
                  verticalSpaceSmall,
                ],
                verticalSpaceMedium,
                verticalSpaceSmall,
                AppButton(
                    title: 'Done', onTap: () => viewModel.onDone(completer)),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  InputFieldSheetModel viewModelBuilder(BuildContext context) =>
      InputFieldSheetModel();
}
