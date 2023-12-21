import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/search_view/search_view_view.form.dart';
import 'package:bnbit_app/ui/widgets/app_back_button.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/image_place_holder.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/not_found_widget.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/profile_pic_builder.dart';
import 'package:bnbit_app/ui/widgets/ra_skeleton_loader.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/algorithm_helpers.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/cupertino.dart';
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
  const SearchViewView({
    Key? key,
    this.homeViewCallBack,
  }) : super(key: key);
  final void Function(int)? homeViewCallBack;

  @override
  void onViewModelReady(SearchViewViewModel viewModel) {
    viewModel.onInit();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(SearchViewViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SearchViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _HeaderWidget(
              searchController: searchController,
              homeViewCallBack: homeViewCallBack,
            ),
            Expanded(
              child: Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  children: [
                    verticalSpaceTiny,
                    if (viewModel.hasError) ...[
                      verticalSpaceLarge,
                      NotFoundWidget(
                        onTap: viewModel.getBusinesses,
                        title: "Something went wrong!",
                        subTitle: "We're having issues loading this page",
                      )
                    ] else
                      Expanded(
                        child: Column(
                          children: [
                            verticalSpace(18),
                            if (viewModel.hasError) ...[
                              verticalSpaceLarge,
                              NotFoundWidget(
                                onTap: viewModel.getBusinesses,
                                title: "Something went wrong!",
                                subTitle:
                                    "We're having issues loading businesses",
                              )
                            ] else
                              Expanded(
                                child: SingleChildScrollView(
                                    child: _BodySection(searchController)),
                              )
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
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

class _BodySection extends ViewModelWidget<SearchViewViewModel> {
  const _BodySection(this.searchController);
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, SearchViewViewModel viewModel) {
    return (!viewModel.isBusy &&
            viewModel.nearByBusinesseses.isEmpty &&
            !viewModel.searchKey.isNullOrEmpty &&
            viewModel.isSearchForKeyWord)
        ? Column(
            children: [
              verticalSpaceLarge,
              SvgBuilder(
                svg: noDataSvg,
                height: 70,
                color: kcDark700,
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "No matches for ${viewModel.searchKey} \n ${viewModel.currentLocationName != 'Everywhere' ? 'Around ${viewModel.currentLocationName}' : ' '} ",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        : searchController.text.isNotEmpty
            ? _BusinessWidget(
                businesses: viewModel.nearByBusinesseses,
                searchController: searchController,
              )
            : const SizedBox.shrink();

    // ListView.separated(
    //     itemCount: viewModel.nearByBusinesseses.length,
    //     separatorBuilder: (BuildContext context, int index) {
    //       return verticalSpace(20);
    //     },
    //     itemBuilder: (BuildContext context, int index) {
    //       final business = viewModel.nearByBusinesseses[index];
    //       return _Business(business);
    //     },
    //   );
  }
}

class _BusinessWidget extends ViewModelWidget<SearchViewViewModel> {
  const _BusinessWidget({
    required this.businesses,
    required this.searchController,
    this.isRecentBusinesses = false,
  });

  final List<Business> businesses;
  final TextEditingController searchController;
  final bool isRecentBusinesses;

  @override
  Widget build(BuildContext context, SearchViewViewModel viewModel) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: businesses.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        final business = businesses[index];
        return Padding(
          key: Key(business.id),
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: InkWell(
            onTap: () => viewModel.onBusinessTap(business),
            child: Column(
              children: [
                Row(
                  children: [
                    ProfilePicBuilder(
                      // radius: 2,
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
                                      ? business.images.first.image
                                      : logoImage),
                      size: 50,
                      textStyle: ktsSmallDarkTextStyle(context).copyWith(
                        fontSize: 25,
                      ),
                    ),
                    horizontalSpaceSmall,
                    horizontalSpaceTiny,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RASkeletonLoader(
                            loading: viewModel.isBusy,
                            child: Text(
                              business.name,
                              style:
                                  ktsSemibold(context).copyWith(fontSize: 13),
                            ),
                          ),
                          if (viewModel.isBusy) verticalSpaceTiny,
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
                              style:
                                  ktsDarkSmall(context).copyWith(fontSize: 11),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          verticalSpaceTiny,
                        ],
                      ),
                    ),
                    if (isRecentBusinesses && !viewModel.isBusy) ...[
                      horizontalSpaceSmall,
                      InkWell(
                        onTap: () =>
                            viewModel.onRemoveRecentPlaces(business.id),
                        child: SizedBox(
                          height: 40,
                          child: Icon(
                            Icons.close,
                            color: kcDark.withOpacity(0.8),
                            size: 23,
                          ),
                        ),
                      ),
                    ]
                    // if (!viewModel.isBusy)
                    //   Icon(
                    //     CupertinoIcons.forward,
                    //     color: kcDark700Light,
                    //     size: 20,
                    //   )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Business extends ViewModelWidget<SearchViewViewModel> {
  const _Business(this.business);
  final Business business;

  @override
  Widget build(BuildContext context, SearchViewViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.onBusinessTap(business),
      child: DecoratedContainer(
        withCard: false,
        borderRadius: 8,
        borderColor: kcDark700.withOpacity(0.026),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RASkeletonLoader(
              loading: viewModel.isAddressSearch,
              child: business.images.isNotEmpty
                  ? SizedBox(
                      height: 145,
                      child: PlaceholderImage(
                        placeHolder: const ImagePlaceHolder(),
                        roundedCorners: false,
                        fit: BoxFit.cover,
                        imageUrl: business.cover_image ??
                            baseUrl + '/' + business.images.first.image,
                        errorImageUrl: placeHolderImage,
                      ),
                    )
                  : ImageBuilder(
                      imagePath: placeHolderImage,
                      height: 145,
                      width: screenWidth(context),
                      fit: BoxFit.cover,
                    ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: RASkeletonLoader(
                loading: viewModel.isAddressSearch,
                child: Text(
                  business.name,
                  style: ktsSemibold(context).copyWith(fontSize: 14),
                ),
              ),
            ),
            verticalSpaceTiny,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  RASkeletonLoader(
                    loading: viewModel.isAddressSearch,
                    child: const SvgBuilder(
                      svg: locationSvg,
                      height: 14,
                    ),
                  ),
                  horizontalSpaceTiny,
                  Expanded(
                    child: RASkeletonLoader(
                      loading: viewModel.isAddressSearch,
                      child: Text(
                        business.addresses.length == 1
                            ? business.addresses.first.label ??
                                business.addressName ??
                                ''
                            : '${business.addresses.length} locations',
                        style: ktsDarkSmall(context).copyWith(fontSize: 11),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  horizontalSpaceMedium,
                  RASkeletonLoader(
                    loading: viewModel.isAddressSearch,
                    child: Text(getFormattedDistance(business.distance ?? 0)),
                  )
                ],
              ),
            ),
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }
}

class _HeaderWidget extends ViewModelWidget<SearchViewViewModel> {
  const _HeaderWidget({
    required this.searchController,
    this.homeViewCallBack,
  });
  final void Function(int)? homeViewCallBack;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, SearchViewViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceSmall,
        // const _HeaderSlidingSegment(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.max,
        //   children: [
        //     const SvgBuilder(
        //       svg: locationSvg,
        //       color: kcPrimaryColor,
        //       height: 16,
        //     ),
        //     horizontalSpaceTiny,
        //     Flexible(
        //       child: Text(
        //         // viewModel.currentLocationName ??
        //         'Addis Aababa',
        //         style: ktsSmall(context).copyWith(
        //           fontSize: 13,
        //           color: kcPrimaryColor,
        //         ),
        //         overflow: TextOverflow.ellipsis,
        //         textAlign: TextAlign.end,
        //         maxLines: 1,
        //       ),
        //     ),
        //   ],
        // ),
        // verticalSpaceSmall,
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: AppBackButton(
                    onTap: () => homeViewCallBack!.call(0),
                  ),
                ),
                horizontalSpaceTiny,
                Expanded(
                  child: InputField(
                    onChanged: viewModel.onChange,
                    autoFocus: true,
                    // prefixIcon: Padding(
                    //   padding: const EdgeInsets.all(14.0),
                    //   child: SizedBox(
                    //     height: 20,
                    //     width: 20,
                    //     child: SvgBuilder(
                    //       svg: searchSvg,
                    //       color: kcDark700,
                    //     ),
                    //   ),
                    // ),
                    fieldHeight: 47,
                    onTap: () => viewModel.setSearchForKeyWordValue(false),
                    //backgroundColor: kcLightGrey.withOpacity(0.08),
                    hasBoxDecoration: false,
                    hasInputDecoration: false,
                    contentPadding: const EdgeInsets.fromLTRB(18, 4, 4, 16),
                    controller: searchController,
                    placeholder: 'Search',
                    maxLine: 1,
                  ),
                ),
                horizontalSpaceSmall,
                InkWell(
                  onTap: () {
                    viewModel.clearForm();
                    viewModel.onChange('');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      height: 45,
                      child: Icon(
                        Icons.close,
                        color: kcDark.withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 0.2,
            ),
          ],
        ),

        Padding(
          padding: appSymmetricEdgePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (viewModel.searchKey.isNotEmpty &&
                  !viewModel.isAddressSearch) ...[
                verticalSpaceSmall,
                verticalSpaceTiny,
                InkWell(
                  onTap: () {
                    viewModel.onSearchForTheKeyWord();
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4.4),
                          child: SizedBox(
                            height: 13,
                            child: SvgBuilder(svg: searchSvg),
                          ),
                        ),
                        horizontalSpaceSmall,
                        Flexible(
                          child: Text(
                            ' Search for ${viewModel.searchKey} ',
                            style: ktsSmall(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              if (viewModel.searchKey.isEmpty) ...[
                verticalSpaceMedium,
                Text(
                  'Recent searches',
                  style: ktsSemibold(context).copyWith(
                    fontSize: 13,
                    color: kcDark.withOpacity(0.9),
                  ),
                ),
                verticalSpaceSmall,
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: viewModel.recentSearches.length < 5
                      ? viewModel.recentSearches.length
                      : 4,
                  separatorBuilder: (BuildContext context, int index) {
                    return verticalSpaceSmall;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final recentSearchKeyword = viewModel.recentSearches[index];
                    return InkWell(
                      onTap: () {
                        searchController.text = recentSearchKeyword;
                        FocusScope.of(context).unfocus();
                        viewModel.onRecentSearchTap(recentSearchKeyword);
                      },
                      child: Row(
                        children: [
                          const SvgBuilder(
                            svg: recentSvg,
                            height: 15,
                          ),
                          horizontalSpaceSmall,
                          Text(
                            recentSearchKeyword,
                            style: ktsDarkSmall(context).copyWith(
                              color: kcDark700,
                            ),
                          ),
                          const Spacer(),
                          horizontalSpaceTiny,
                          InkWell(
                            onTap: () =>
                                viewModel.onRemoveHistory(recentSearchKeyword),
                            child: SizedBox(
                              height: 25,
                              width: 30,
                              child: Icon(
                                Icons.close,
                                color: kcDark.withOpacity(0.7),
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                verticalSpaceSmall,
                if (viewModel.recentSearches.length >= 5)
                  InkWell(
                    onTap: () async {
                      await viewModel.onSeeAll(searchController);
                      FocusScope.of(context).unfocus();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'See All',
                        style: ktsSemibold300(context).copyWith(
                          fontSize: 13,
                          color: kcPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                if (viewModel.recentVisitedBusinesses.isNotEmpty) ...[
                  verticalSpaceMedium,
                  Text(
                    'Last visited places',
                    style: ktsSemibold(context).copyWith(
                      fontSize: 13,
                      color: kcDark.withOpacity(0.9),
                    ),
                  ),
                  verticalSpaceSmall,
                  _BusinessWidget(
                    isRecentBusinesses: true,
                    businesses: viewModel.recentVisitedBusinesses,
                    searchController: searchController,
                  ),
                ]
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderSlidingSegment extends ViewModelWidget<SearchViewViewModel> {
  const _HeaderSlidingSegment();

  @override
  Widget build(BuildContext context, SearchViewViewModel viewModel) {
    final entries = viewModel.searchTypeMapping.entries;

    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<SearchType>(
        groupValue: viewModel.selectedSearchType,
        backgroundColor: kcLightGrey.withOpacity(0.2),
        thumbColor: kcPrimary2Color,
        padding: const EdgeInsets.all(6.0),
        children: <SearchType, Widget>{
          for (var segment in entries)
            segment.key: _HeaderSegment(
              value: segment.value,
              selected: segment.key == viewModel.selectedSearchType,
            ),
        },
        onValueChanged: (value) => viewModel.onSearchTypeTap(value!),
      ),
    );
  }
}

class _HeaderSegment extends StatelessWidget {
  final String value;
  final bool selected;
  const _HeaderSegment({Key? key, required this.value, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(value.toUpperCase(),
          style: selected
              ? ktsWhite(context: context)
              : ktsWhite(context: context).copyWith(
                  color: kcDark700Light,
                )),
    );
  }
}
