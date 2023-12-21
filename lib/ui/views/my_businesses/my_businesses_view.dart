import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/not_found_widget.dart';
import 'package:bnbit_app/ui/widgets/profile_pic_builder.dart';
import 'package:bnbit_app/ui/widgets/ra_skeleton_loader.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/decorated_container.dart';
import 'my_businesses_viewmodel.dart';

class MyBusinessesView extends StackedView<MyBusinessesViewModel> {
  const MyBusinessesView({
    Key? key,
    this.isSavedBusiness = false,
  }) : super(key: key);

  final bool isSavedBusiness;

  @override
  void onViewModelReady(MyBusinessesViewModel viewModel) {
    viewModel.onInit(isSavedBusiness);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    MyBusinessesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButton: isSavedBusiness
          ? SizedBox.fromSize()
          : DecoratedContainer(
              shadowOpacity: 0.2,
              borderColor: Theme.of(context).colorScheme.tertiary,
              shadowColor: Theme.of(context).colorScheme.tertiary,
              containerColor: Theme.of(context).colorScheme.tertiary,
              hasBorder: false,
              borderRadius: 1000,
              child: FloatingActionButton(
                backgroundColor: kcPrimaryColor,
                onPressed: viewModel.onAddBusiness,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: isSavedBusiness ? 'Saved Businesses' : 'My Businesses',
            ),
            if (viewModel.hasError)
              Padding(
                padding: EdgeInsets.only(top: screenHeight(context) / 6),
                child: NotFoundWidget(
                  onTap: viewModel.getMyBusinesses,
                  title: "Something went wrong!",
                  subTitle: "We're having issues loading this page",
                ),
              )
            else if (!viewModel.isBusy && viewModel.myBusinesses.isEmpty)
              Padding(
                padding: EdgeInsets.only(top: screenHeight(context) / 6),
                child: NotFoundWidget(
                  onTap: isSavedBusiness ? null : viewModel.getMyBusinesses,
                  title: isSavedBusiness
                      ? "You haven't saved any business yet!"
                      : "You haven't created a business yet!",
                  subTitle: "When you have businesses, they'll show up here.",
                  buttonTitle: isSavedBusiness ? '' : 'Tap to create one',
                ),
              )
            else
              AbsorbPointer(
                absorbing: viewModel.isBusy,
                child: Column(
                  children: [
                    verticalSpaceSmall,
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: viewModel.myBusinesses.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final business = viewModel.myBusinesses[index];
                        return Padding(
                          padding: appSymmetricEdgePadding,
                          child: InkWell(
                            onTap: () =>
                                viewModel.onBusinessTap(business, index),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ProfilePicBuilder(
                                      radius: 2,
                                      loading: viewModel.isBusy,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.14),
                                      url: viewModel.isBusy
                                          ? ""
                                          : business.cover_image ??
                                              baseUrl +
                                                  '/' +
                                                  (business.images.isNotEmpty
                                                      ? business
                                                          .images.first.image
                                                      : logoImage),
                                      size: 50,
                                      textStyle: ktsSmallDarkTextStyle(context)
                                          .copyWith(
                                        fontSize: 25,
                                      ),
                                    ),
                                    horizontalSpaceSmall,
                                    horizontalSpaceSmall,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RASkeletonLoader(
                                            loading: viewModel.isBusy,
                                            child: Text(
                                              business.name,
                                              style: ktsSemibold(context)
                                                  .copyWith(fontSize: 13),
                                            ),
                                          ),
                                          if (viewModel.isBusy)
                                            verticalSpaceTiny,
                                          RASkeletonLoader(
                                            loading: viewModel.isBusy,
                                            child: Text(
                                              business.subcategories
                                                  .map((e) => e.name)
                                                  .toString()
                                                  .replaceAll('(', '')
                                                  .replaceAll(')', '')
                                                  .replaceAll('...', '')
                                                  .replaceAll(', ,', ','),
                                              style: ktsDarkSmall(context)
                                                  .copyWith(fontSize: 11),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (!viewModel.isBusy)
                                      Icon(
                                        CupertinoIcons.forward,
                                        color: kcDark700Light,
                                        size: 20,
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  MyBusinessesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyBusinessesViewModel();
}
