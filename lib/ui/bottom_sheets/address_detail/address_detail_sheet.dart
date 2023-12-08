import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'address_detail_sheet.form.dart';
import 'address_detail_sheet_model.dart';

import '../../common/shared_styles.dart';
import '../basic_bottom_sheet.dart';

@FormView(
  fields: [
    FormTextField(
      name: "address",
    ),
  ],
)
class AddressDetailSheet extends StackedView<AddressDetailSheetModel>
    with $AddressDetailSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddressDetailSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  void onViewModelReady(AddressDetailSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(AddressDetailSheetModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    AddressDetailSheetModel viewModel,
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
                      request.title ?? 'Select Category',
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
                  placeholder: request.title ?? '',
                  labelText: request.title ?? '',

                  maxLine: 1,
                  autoFocus: true,
                  // onChanged: viewModel.onChange,
                  hasFocusedBorder: true,
                  textInputType: request.title == 'Phone Number'
                      ? TextInputType.phone
                      : TextInputType.text,
                  isReadOnly: viewModel.isBusy,
                  controller: addressController,
                ),
                verticalSpaceMedium,
                verticalSpaceSmall,
                AppButton(
                  enabled: request.title == 'Phone Number'
                      ? addressController.text.length > 9
                      : addressController.text.length > 2,
                  title: 'Done',
                  onTap: () => completer?.call(
                    SheetResponse(data: addressController.text),
                  ),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  AddressDetailSheetModel viewModelBuilder(BuildContext context) =>
      AddressDetailSheetModel();
}
