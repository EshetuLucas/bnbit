import 'package:bnbit_app/ui/bottom_sheets/single_input/single_input_sheet.form.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'single_input_sheet_model.dart';

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

@FormView(
  fields: [
    FormTextField(
      name: "input",
    ),
  ],
)
class SingleInputSheet extends StackedView<SingleInputSheetModel>
    with $SingleInputSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SingleInputSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);
  @override
  void onViewModelReady(SingleInputSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(SingleInputSheetModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SingleInputSheetModel viewModel,
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
                      request.title ?? 'Input',
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
                  password: true,
                  // onChanged: (_) => viewModel.setServiceValidation(''),
                  hasFocusedBorder: true,
                  textInputType: TextInputType.text,
                  isReadOnly: viewModel.isBusy,
                  controller: inputController,
                ),
                // if (viewModel.serviceValidationMessage.isNotEmpty) ...[
                //   ValidationMessage(title: viewModel.serviceValidationMessage),
                //   verticalSpaceSmall,
                // ],
                verticalSpaceMedium,
                verticalSpaceSmall,
                AppButton(
                  title: 'Done',
                  onTap: () => completer?.call(SheetResponse(
                    data: inputController.text,
                  )),
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
  SingleInputSheetModel viewModelBuilder(BuildContext context) =>
      SingleInputSheetModel();
}
