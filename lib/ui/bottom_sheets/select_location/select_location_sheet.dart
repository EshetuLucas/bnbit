import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/bottom_sheets/select_location/select_location_sheet.form.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'select_location_sheet_model.dart';

@FormView(
  fields: [
    FormTextField(
      name: "search",
    ),
  ],
)
class SelectLocationSheet extends StackedView<SelectLocationSheetModel>
    with $SelectLocationSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SelectLocationSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  void onDispose(SelectLocationSheetModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  void onViewModelReady(SelectLocationSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.onInit();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SelectLocationSheetModel viewModel,
    Widget? child,
  ) {
    return FrostedBottomSheet(
        child: 
        
        Column(
      children: [
        verticalSpaceMedium,
        Padding(
          padding: appSymmetricEdgePadding,
          child: InputField(
            onChanged: viewModel.onChange,
            autoFocus: true,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Theme.of(context).colorScheme.surface,
            ),
            hasFocusedBorder: true,
            contentPadding: const EdgeInsets.fromLTRB(18, 4, 4, 4),
            fieldHeight: 49,
            controller: searchController,
            placeholder: 'Search',
            maxLine: 1,
          ),
        ),
        verticalSpaceMedium,
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            shrinkWrap: true,
            itemCount: viewModel.autoCompleteResults.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: appSymmetricEdgePadding,
                child: InkWell(
                  onTap: () {
                    searchController.clear();
                    searchController.text =
                        viewModel.autoCompleteResults[index].mainText ?? '';

                    viewModel.onPlaceTap(index);
                    Future.delayed(const Duration(milliseconds: 350))
                        .then((_) => FocusScope.of(context).unfocus());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        const SvgBuilder(
                          svg: locationSvg,
                          height: 19,
                        ),
                        horizontalSpaceSmall,
                        horizontalSpaceTiny,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewModel.autoCompleteResults[index].mainText ??
                                    '',
                                style: ktsSmall(context),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                  viewModel.autoCompleteResults[index]
                                          .secondaryText ??
                                      '',
                                  style:
                                      ktsSmall(context).copyWith(fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ));
  }

  @override
  SelectLocationSheetModel viewModelBuilder(BuildContext context) =>
      SelectLocationSheetModel(completer);
}
