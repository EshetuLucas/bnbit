import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'recent_searches_viewmodel.dart';

class RecentSearchesView extends StackedView<RecentSearchesViewModel> {
  const RecentSearchesView({
    Key? key,
    required this.recentSearches,
    required this.nameKey,
    required this.title,
  }) : super(key: key);
  final List<String> recentSearches;
  final String nameKey;
  final String title;

  @override
  Widget builder(
    BuildContext context,
    RecentSearchesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: appSymmetricEdgePadding,
        child: Column(
          children: [
            CustomAppBar(
              title: title,
              hasPadding: false,
              tail: InkWell(
                child: Text(
                  'Clear all',
                  style: ktsDarkSmall(context).copyWith(
                    color: kcPrimaryColor,
                  ),
                ),
              ),
            ),
            verticalSpaceSmall,
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: viewModel.searchHistory.length,
              separatorBuilder: (BuildContext context, int index) {
                return verticalSpaceSmall;
              },
              itemBuilder: (BuildContext context, int index) {
                final recentSearchKeyword = viewModel.searchHistory[index];
                return InkWell(
                  onTap: () => viewModel.onHistoryTap(recentSearchKeyword),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.clock,
                        color: kcDark700,
                      ),
                      horizontalSpaceSmall,
                      horizontalSpaceSmall,
                      Text(
                        viewModel.isAddressHistory
                            ? viewModel.recentAddresses[index].displayAddress
                            : recentSearchKeyword,
                        style: ktsDarkSmall(context).copyWith(
                          color: kcDark700,
                        ),
                      ),
                      const Spacer(),
                      horizontalSpaceTiny,
                      InkWell(
                        onTap: () => viewModel.isAddressHistory
                            ? viewModel.onRemoveAddressHistory(
                                viewModel.recentAddresses[index])
                            : viewModel.onRemoveHistory(recentSearchKeyword),
                        child: SizedBox(
                          height: 28,
                          width: 30,
                          child: Icon(
                            Icons.close,
                            color: kcDark.withOpacity(0.7),
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }

  @override
  RecentSearchesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RecentSearchesViewModel(key: nameKey, searchHistory: recentSearches);
}
