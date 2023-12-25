import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_back_button.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/image_place_holder.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/ra_skeleton_loader.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/algorithm_helpers.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../widgets/profile_pic_builder.dart';
import 'address_searches_view.form.dart';
import 'address_searches_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "search",
    ),
  ],
)
class AddressSearchesView extends StackedView<AddressSearchesViewModel>
    with $AddressSearchesView {
  const AddressSearchesView({Key? key}) : super(key: key);

  @override
  void onDispose(AddressSearchesViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  void onViewModelReady(AddressSearchesViewModel viewModel) {
    viewModel.onInit();
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    AddressSearchesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          verticalSpaceTiny,
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: AppBackButton(),
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
                  padding: const EdgeInsets.only(right: 14),
                  child: SizedBox(
                    height: 45,
                    child: Icon(
                      Icons.close,
                      color: kcDark.withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              horizontalSpaceSmall,
            ],
          ),
          const Divider(
            height: 0.2,
          ),
          verticalSpaceSmall,
          if (viewModel.showList)
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _MyLocation(),
                ),
                verticalSpaceSmall,
                Container(
                  color: kcWhite,
                  //  margin: appSymmetricEdgePadding,
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
                                viewModel.autoCompleteResults[index].mainText ??
                                    '';

                            viewModel.onPlaceTap(index);
                            FocusScope.of(context).unfocus();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                if (viewModel.isBusy &&
                                    viewModel.isSelectedIndex(index))
                                  const SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: Spinner(),
                                  )
                                else
                                  const SvgBuilder(
                                    svg: locationSvg,
                                    height: 19,
                                  ),
                                horizontalSpaceSmall,
                                horizontalSpaceTiny,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        viewModel.autoCompleteResults[index]
                                                .mainText ??
                                            '',
                                        style: ktsSmall(context),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                          viewModel.autoCompleteResults[index]
                                                  .secondaryText ??
                                              '',
                                          style: ktsSmall(context)
                                              .copyWith(fontSize: 10)),
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
                ),
              ],
            )
          else
            _BodySection(searchController)
        ],
      ),
    ));
  }

  @override
  AddressSearchesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddressSearchesViewModel(searchController);
}

class _MyLocation extends ViewModelWidget<AddressSearchesViewModel> {
  const _MyLocation();

  @override
  Widget build(BuildContext context, AddressSearchesViewModel viewModel) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            viewModel.setCurrentLocation();
          },
          child: Row(
            children: [
              const Icon(
                Icons.my_location,
                color: kcPrimaryColor,
              ),
              horizontalSpaceSmall,
              Text(
                'Use My Current Location',
                style: ktsSmall(context).copyWith(
                  color: kcPrimaryColor,
                ),
              )
            ],
          ),
        ),
        verticalSpaceSmall,
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            viewModel.defaultLocation();
          },
          child: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: kcPrimaryColor,
              ),
              horizontalSpaceSmall,
              Text(
                'Default Location',
                style: ktsSmall(context).copyWith(
                  color: kcPrimaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _BodySection extends ViewModelWidget<AddressSearchesViewModel> {
  const _BodySection(this.searchController);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, AddressSearchesViewModel viewModel) {
    return

        // (!viewModel.isBusy &&
        //         viewModel.nearByBusinesseses.isEmpty &&
        //         viewModel.searchController.text.isNotEmpty)
        //     ? Column(
        //         children: [
        //           verticalSpaceLarge,
        //           SvgBuilder(
        //             svg: noDataSvg,
        //             height: 70,
        //             color: kcDark700,
        //           ),
        //           verticalSpaceSmall,
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 30),
        //             child: Text(
        //               "No data found ${viewModel.searchKey} \nAround selected location",
        //               textAlign: TextAlign.center,
        //             ),
        //           )
        //         ],
        //       )
        //     : viewModel.searchKey.isEmpty && searchController.text.isEmpty
        //         ?

        Padding(
      padding: appSymmetricEdgePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _MyLocation(),
          verticalSpaceSmall,
          verticalSpaceSmall,
          Text(
            'Recent places',
            style: ktsSemibold(context).copyWith(
              fontSize: 14,
              color: kcDark.withOpacity(0.9),
            ),
          ),
          verticalSpaceSmall,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: viewModel.recentAddresses.length < 5
                ? viewModel.recentAddresses.length
                : 4,
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpaceSmall;
            },
            itemBuilder: (BuildContext context, int index) {
              final recentSearchKeyword = viewModel.recentAddresses[index];
              return InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  viewModel.onRecentSearchTap(index);
                },
                child: Row(
                  children: [
                    const SvgBuilder(
                      svg: recentSvg,
                      height: 15,
                    ),
                    horizontalSpaceSmall,
                    Expanded(
                      child: Text(
                        recentSearchKeyword.displayAddress,
                        style: ktsDarkSmall(context).copyWith(
                          color: kcDark700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    horizontalSpaceTiny,
                    InkWell(
                      onTap: () =>
                          viewModel.onRemoveHistory(recentSearchKeyword),
                      child: SizedBox(
                        height: 30,
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
          if (viewModel.recentAddresses.length >= 5)
            InkWell(
              onTap: () => viewModel.onSeeAll(),
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
            )
        ],
      ),
    );
    // :
    // // _Business(
    // //     // businesses: viewModel.nearByBusinesseses,
    // //     );

    // _BusinessWidget(
    //     businesses: viewModel.nearByBusinesseses,
    //   );

    // ListView.separated(
    //     physics: const NeverScrollableScrollPhysics(),
    //     shrinkWrap: true,
    //     padding: appSymmetricEdgePadding,
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

class _Business extends ViewModelWidget<AddressSearchesViewModel> {
  const _Business(this.business);
  final Business business;

  @override
  Widget build(BuildContext context, AddressSearchesViewModel viewModel) {
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
              loading: viewModel.isBusy,
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
                loading: viewModel.isBusy,
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
                    loading: viewModel.isBusy,
                    child: const SvgBuilder(
                      svg: locationSvg,
                      height: 14,
                    ),
                  ),
                  horizontalSpaceTiny,
                  Expanded(
                    child: RASkeletonLoader(
                      loading: viewModel.isBusy,
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
                    loading: viewModel.isBusy,
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

class _BusinessWidget extends ViewModelWidget<AddressSearchesViewModel> {
  const _BusinessWidget({required this.businesses});

  final List<Business> businesses;

  @override
  Widget build(BuildContext context, AddressSearchesViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: businesses.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          final business = businesses[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: InkWell(
              onTap: () => viewModel.onBusinessTap(business),
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
                                baseUrl + '/' + business.images.first.image,
                        size: 60,
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
                                style: ktsDarkSmall(context)
                                    .copyWith(fontSize: 11),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            RASkeletonLoader(
                              loading: viewModel.isBusy,
                              child: Text(
                                business.addresses.length == 1
                                    ? business.addresses.first.label ??
                                        business.addressName ??
                                        ''
                                    : '${business.addresses.length} locations',
                                style: ktsDarkSmall(context)
                                    .copyWith(fontSize: 11),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            verticalSpaceTiny,
                          ],
                        ),
                      ),
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
      ),
    );
  }
}
