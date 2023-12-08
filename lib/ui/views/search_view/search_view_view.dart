import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/search_view/search_view_view.form.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'search_view_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "search",
    ),
  ],
)
class SearchViewView extends StackedView<SearchViewViewModel>
    with $SearchViewView {
  const SearchViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: true
              ? Center(child: Text('Working on this feature'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      onChanged: viewModel.onChange,
                      autoFocus: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgBuilder(
                            svg: searchSvg,
                            color: kcDark700,
                          ),
                        ),
                      ),
                      hasFocusedBorder: true,
                      contentPadding: const EdgeInsets.fromLTRB(18, 4, 4, 4),
                      fieldHeight: 49,
                      controller: searchController,
                      placeholder: 'Search',
                      maxLine: 1,
                    ),
                    verticalSpaceMedium,
                    Text(
                      'Recent searches',
                      style: ktsSmall(context),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  SearchViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewViewModel();
}
