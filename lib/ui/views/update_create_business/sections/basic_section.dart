import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/update_create_business/widgets/operating_hours.dart';
import 'package:bnbit_app/ui/views/update_create_business/widgets/section_item_title.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../update_create_business_viewmodel.dart';
import '../widgets/section_title.dart';

const String _name = 'Name';
const String _description = 'Description';

class BasicSection extends ViewModelWidget<UpdateCreateBusinessViewModel> {
  const BasicSection({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.categoryTitle,
    required this.servicesController,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;

  final TextEditingController servicesController;

  final String categoryTitle;

  @override
  Widget build(BuildContext context, UpdateCreateBusinessViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Business name & detail'),
        verticalSpaceSmall,
        const SectionItemTitle(_name),
        verticalSpaceTiny,
        InputField(
          placeholder: _name,
          maxLine: 1,
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: nameController,
        ),
        if (!viewModel.hasNoValidName) verticalSpaceSmall,
        if (viewModel.hasNoValidName) ...[
          ValidationMessage(title: viewModel.nameValidationMessage),
          verticalSpaceSmall,
        ],
        const SectionItemTitle(_description),
        verticalSpaceTiny,
        InputField(
          placeholder: _description,
          contentPadding: const EdgeInsets.only(
            left: 16,
            top: 18,
            bottom: 0,
            right: 10,
          ),
          maxLine: 6,
          fieldHeight: 110,
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: descriptionController,
        ),
        if (!viewModel.hasNoValidDescription) verticalSpaceSmall,
        if (viewModel.hasNoValidDescription) ...[
          ValidationMessage(title: viewModel.descriptionValidationMessage),
          verticalSpaceSmall,
        ],
        const Divider(),
        verticalSpaceSmall,
        Text(
          categoryTitle,
          style: ktsSmall(context).copyWith(
              fontSize: 13, fontWeight: FontWeight.w600, color: kcPrimaryColor),
        ),
        verticalSpaceSmall,
        const SectionItemTitle('Category & Sub Category'),
        verticalSpaceTiny,
        InkWell(
          onTap: viewModel.onSelectCategory,
          child: InputField(
            hintTextStyle: ktsSmall(context),
            placeholder: viewModel.selectedCategory?.name ?? 'Select Category',
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
        if (viewModel.selectedSubCategories.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 4,
              runSpacing: 6,
              children: viewModel.selectedSubCategories
                  .map(
                    (subCategory) => Wrap(
                      spacing: 4,
                      runSpacing: 6,
                      children: [
                        DecoratedContainer(
                          borderRadius: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Text(
                              subCategory.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: ktsSmall(context),
                            ),
                          ),
                        ),
                        if (viewModel.isLastSubCategory(subCategory))
                          DecoratedContainer(
                            onTap: () =>
                                viewModel.onSelectSubCategory(isAdd: true),
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
          verticalSpaceSmall,
        if (viewModel.selectedBusiness != null) ...[
          const Divider(),
          const SectionTitle('Operating hours'),
          verticalSpaceSmall,
          OperatingHours(
            servicesController: servicesController,
          )
        ]
      ],
    );
  }
}
