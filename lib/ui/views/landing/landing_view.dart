import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/image_place_holder.dart';
import 'package:bnbit_app/ui/widgets/map_view.dart';
import 'package:bnbit_app/ui/widgets/not_found_widget.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/ra_skeleton_loader.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/algorithm_helpers.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

import 'landing_viewmodel.dart';

class LandingView extends StackedView<LandingViewModel> {
  const LandingView({Key? key}) : super(key: key);
  @override
  void onViewModelReady(LandingViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    LandingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!viewModel.isFetchingBusinesses &&
              viewModel.nearByBusinesseses.isNotEmpty)
            InkWell(
              onTap: () => viewModel.onChangeView(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                    12,
                  )),
                  color: kcLightGrey5,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      !viewModel.isMapView ? Icons.map : Icons.menu,
                      color: kcPrimaryColor,
                      size: 18,
                    ),
                    horizontalSpaceTiny,
                    Text(
                      !viewModel.isMapView ? 'Map View' : 'List View',
                      style: ktsSemibold(context).copyWith(
                        color: kcPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (viewModel.isMapView) ...[
            verticalSpaceMassive,
            verticalSpaceSmall,
          ]
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpaceTiny,
            if (viewModel.hasCategoryError) ...[
              verticalSpaceLarge,
              NotFoundWidget(
                onTap: viewModel.init,
                title: "Something went wrong!",
                subTitle: "We're having issues loading this page",
              )
            ] else
              Expanded(
                child: Column(
                  children: [
                    const _Header(),
                    verticalSpace(19),
                    const _SubCategories(),
                    verticalSpace(viewModel.isMapView ? 10 : 18),
                    if (viewModel.hasBusinessError) ...[
                      verticalSpaceLarge,
                      NotFoundWidget(
                        onTap: viewModel.getBusinesses,
                        title: "Something went wrong!",
                        subTitle: "We're having issues loading businesses",
                      )
                    ] else
                      Expanded(
                        child: RefreshIndicator(
                            displacement: 0,
                            onRefresh: () =>
                                viewModel.getBusinesses(loadAgain: false),
                            child: const _BodySection()),
                      )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  LandingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<LandingViewModel>();
}

class _BodySection extends ViewModelWidget<LandingViewModel> {
  const _BodySection();

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return !viewModel.isFetchingBusinesses &&
            viewModel.nearByBusinesseses.isEmpty
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
                  'No businesses found\nAround ${viewModel.currentLocationName}.',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        : Container(
            child: viewModel.isMapView
                ? const MapView()
                : ListView.separated(
                    itemCount: viewModel.nearByBusinesseses.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return verticalSpace(20);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final business = viewModel.nearByBusinesseses[index];
                      return _Business(business);
                    },
                  ),
          );
  }
}

class _Business extends ViewModelWidget<LandingViewModel> {
  const _Business(this.business);
  final Business business;

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.isFetchingBusinesses
          ? {}
          : viewModel.onBusinessTap(business),
      child: Padding(
        padding: appSymmetricEdgePadding,
        child: DecoratedContainer(
          withCard: false,
          borderRadius: 8,
          borderColor: kcDark700.withOpacity(0.026),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RASkeletonLoader(
                loading: viewModel.isFetchingBusinesses,
                child: business.images.isNotEmpty
                    ? SizedBox(
                        height: 145,
                        child: PlaceholderImage(
                          placeHolder: const ImagePlaceHolder(),
                          roundedCorners: false,
                          fit: BoxFit.cover,
                          imageUrl: business.cover_image ??
                              baseUrl +
                                  '/' +
                                  (business.images.isNotEmpty
                                      ? business.images.first.image
                                      : logoImage),
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
                  loading: viewModel.isFetchingBusinesses,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          business.name,
                          style: ktsSemibold(context).copyWith(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      horizontalSpaceSmall,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DecoratedContainer(
                            borderRadius: 4,
                            withCard: false,
                            containerColor:
                                viewModel.getOperatingHour(business).isNotEmpty
                                    ? kcGreen.withOpacity(0.2)
                                    : kcRed.withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Text(
                                viewModel.getOperatingHour(business).isNotEmpty
                                    ? 'Open'
                                    : 'Closed',
                                style: ktsSemibold(context).copyWith(
                                  fontSize: 12,
                                  color: viewModel
                                          .getOperatingHour(business)
                                          .isNotEmpty
                                      ? kcGreen
                                      : kcRed,
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceTiny,
                          if (viewModel.getOperatingHour(business).isNotEmpty)
                            Text(
                              ': Closes at ${viewModel.getOperatingHour(business)}',
                              style: ktsSmall(context).copyWith(fontSize: 12),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    RASkeletonLoader(
                      loading: viewModel.isFetchingBusinesses,
                      child: const SvgBuilder(
                        svg: locationSvg,
                        height: 14,
                      ),
                    ),
                    horizontalSpaceTiny,
                    Expanded(
                      child: RASkeletonLoader(
                        loading: viewModel.isFetchingBusinesses,
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
                      loading: viewModel.isFetchingBusinesses,
                      child: Text(getFormattedDistance(business.distance ?? 0)),
                    )
                  ],
                ),
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}

class _SubCategories extends ViewModelWidget<LandingViewModel> {
  const _SubCategories();

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        key: viewModel.isBusy ? null : PageStorageKey(viewModel.pageKey),
        padding: appSymmetricEdgePadding,
        shrinkWrap: viewModel.isBusy,
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.subCategories.length,
        separatorBuilder: (BuildContext context, int index) {
          return horizontalSpaceSmall;
        },
        itemBuilder: (BuildContext context, int index) {
          final subCategory = viewModel.subCategories[index];
          final isSelected = viewModel.isSelected(index);
          return InkWell(
            onTap: () => viewModel.onSubCategoryTap(index),
            child: Padding(
              padding: EdgeInsets.only(
                right: viewModel.isBusy ? 10 : 18,
              ),
              child: RASkeletonLoader(
                radius: 12,
                loading: viewModel.isBusy,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                      child:
                          // viewModel.isBusy || subCategory.svg == null
                          //     ?
                          //     Icon(
                          //   Icons.ac_unit,
                          //   color: isSelected
                          //       ? kcPrimaryColor
                          //       : Theme.of(context)
                          //           .colorScheme
                          //           .onPrimary
                          //           .withOpacity(0.6),
                          // )
                          // :
                          SvgBuilder(
                        fit: BoxFit.cover,
                        key: Key(subCategory.id),
                        svg: svgsPath + '/${subCategory.name}.svg',
                        height: 25,
                        color: isSelected
                            ? kcPrimaryColor
                            : Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.6),
                      ),
                    ),
                    verticalSpaceTiny,
                    SizedBox(
                      // constraints: const BoxConstraints(maxWidth: 100),
                      height: 20,
                      child: Text(
                        subCategory.name,

                        style: ktsWhiteSmallTextStyle(context).copyWith(
                          fontWeight:
                              isSelected ? FontWeight.w500 : FontWeight.w100,
                          fontSize: isSelected ? 12 : 11,
                          color: isSelected
                              ? kcPrimaryColor
                              : Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.6),
                        ),
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.clip,
                        // maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Header extends ViewModelWidget<LandingViewModel> {
  const _Header();

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 8),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: screenWidth(context) / 1.5,
              ),
              child: InkWell(
                onTap: viewModel.onChangeCategory,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceTiny,
                    RASkeletonLoader(
                      loading: viewModel.isBusy,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              viewModel.isBusy
                                  ? '                 '
                                  : viewModel.selectedCategory.name,
                              style:
                                  ktsBoldMeidumDarkTextStyle(context).copyWith(
                                color: kcPrimaryColor,
                                fontSize: 18.4,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          horizontalSpaceTiny,
                          const Icon(
                            Icons.expand_more,
                            size: 25,
                            color: kcPrimaryColor,
                          )
                        ],
                      ),
                    ),
                    if (!viewModel.isBusy)
                      Text(
                        'Tap to change category',
                        style: ktsSmall(context).copyWith(
                          fontSize: 10,
                          color: kcDark700Light,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (viewModel.isBusy) horizontalSpaceLarge else horizontalSpaceSmall,

          Flexible(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: RASkeletonLoader(
                loading: viewModel.isBusy,
                child: InkWell(
                  onTap: viewModel.onLocationTap,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: RASkeletonLoader(
                      loading: viewModel.isBusy,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SvgBuilder(
                            svg: locationSvg,
                            color: kcPrimaryColor,
                            height: 14,
                          ),
                          horizontalSpace(2),
                          Flexible(
                            child: Text(
                              viewModel.currentLocationName ?? 'Addis Aababa',
                              style: ktsSmall(context).copyWith(
                                fontSize: 11,
                                color: kcPrimaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // const SvgBuilder(
          //   svg: searchSvg,
          //   color: kcPrimaryColor,
          //   height: 20,
          // ),
          horizontalSpaceSmall,
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       RASkeletonLoader(
          //         loading: viewModel.isFetchingBusinesses,
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             const SvgBuilder(svg: locationSvg),
          //             Flexible(
          //               child: Text(
          //                 viewModel.currentLocationName ?? ' ',
          //                 style: ktsSmall(context).copyWith(fontSize: 11),
          //                 overflow: TextOverflow.ellipsis,
          //                 textAlign: TextAlign.end,
          //                 maxLines: 1,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       verticalSpaceTiny,
          //       RASkeletonLoader(
          //         loading: viewModel.isFetchingBusinesses,
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             InkWell(
          //               onTap: viewModel.onChangeView,
          //               child: Icon(
          //                 Icons.menu,
          //                 color: !viewModel.isMapView
          //                     ? kcPrimaryColor
          //                     : kcDark700Light,
          //                 size: 22,
          //               ),
          //             ),
          //             horizontalSpaceMedium,
          //             InkWell(
          //               onTap: viewModel.onChangeView,
          //               child: Icon(
          //                 color: viewModel.isMapView
          //                     ? kcPrimaryColor
          //                     : kcDark700Light,
          //                 Icons.map,
          //                 size: 22,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MapView extends ViewModelWidget<LandingViewModel> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (!viewModel.isFetchingBusinesses)
          GoogleMapPage(
            markers: viewModel.getMarkers(
                latlngs: viewModel.nearByBusinesseses
                    .map((e) => e.addresses
                        .toList()
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList())
                    .first,
                currentLocation: LatLng(
                  viewModel.currentLocation!.latitude!,
                  viewModel.currentLocation!.longitude!,
                )),
            lat: viewModel.currentLocation!.latitude!,
            long: viewModel.currentLocation!.longitude!,
            latlngs: viewModel.nearByBusinesseses
                .map((e) => e.addresses
                    .toList()
                    .map((e) => LatLng(e.latitude, e.longitude))
                    .toList())
                .first,
            markerbitmap: viewModel.markerbitmap,
            nearbyMarkerbitmap: viewModel.nearbyMarkerbitmap,
            cameraTarget: LatLng(
              viewModel.currentLocation!.latitude!,
              viewModel.currentLocation!.longitude!,
            ),
            onMapCreated: viewModel.onMapCreated,
          )
        //G - 26
        else
          GoogleMapPage(
            key: const Key('Loading'),
            lat: viewModel.currentLocation!.latitude!,
            long: viewModel.currentLocation!.longitude!,
            latlngs: const [],
            markerbitmap: viewModel.markerbitmap,
            nearbyMarkerbitmap: viewModel.nearbyMarkerbitmap,
            cameraTarget: LatLng(
              viewModel.currentLocation!.latitude!,
              viewModel.currentLocation!.longitude!,
            ),
            onMapCreated: viewModel.onLoadingMapCreated,
          ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: _BusinessPreviewCarousel(height: 132),
        )
      ],
    );
  }
}

class _BusinessPreviewCarousel extends ViewModelWidget<LandingViewModel> {
  final double height;

  const _BusinessPreviewCarousel({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return CarouselSlider(
      carouselController: viewModel.carouselController,
      options: CarouselOptions(
        height: height,
        aspectRatio: 2.0,
        viewportFraction: 0.85,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        enlargeFactor: 0.18,
        onPageChanged: (index, reason) =>
            viewModel.onChangeBusiness(viewModel.nearByBusinesseses[index]),
      ),
      items: viewModel.nearByBusinesseses.map((business) {
        return Builder(
          builder: (BuildContext context) {
            return BusinessCard(
              height: height,
              business: business,
              onTap: () => viewModel.onBusinessTap(business),
            );
          },
        );
      }).toList(),
    );
  }
}

class BusinessCard extends ViewModelWidget<LandingViewModel> {
  final double? height;
  final Business business;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final String? venuePreference;
  final bool isUserAuthenticated;
  final Function()? onNavigate;

  const BusinessCard(
      {Key? key,
      this.height = 235,
      this.onTap,
      this.onTapFavorite,
      this.venuePreference,
      this.isUserAuthenticated = false,
      required this.business,
      this.onNavigate})
      : super(key: key);

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return DecoratedContainer(
      onTap: onTap,
      borderRadius: 12,
      elevation: 0,
      shadowColor: kcWhite,
      withCard: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.topLeft,
                height: height,
                child: Stack(
                  children: [
                    RASkeletonLoader(
                      loading: viewModel.isFetchingBusinesses,
                      child: business.images.isNotEmpty
                          ? SizedBox(
                              height: 145,
                              child: PlaceholderImage(
                                placeHolder: const ImagePlaceHolder(),
                                roundedCorners: false,
                                fit: BoxFit.cover,
                                imageUrl: business.cover_image ??
                                    baseUrl +
                                        '/' +
                                        (business.images.isNotEmpty
                                            ? business.images.first.image
                                            : logoImage),
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
                    // if (business.distance! < 0.9)
                    //   Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         color: kcPrimaryColor.withOpacity(0.6),
                    //         borderRadius: const BorderRadius.only(
                    //           topLeft: Radius.circular(8),
                    //         ),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(4.0),
                    //         child: Text(
                    //           'Nearby',
                    //           style: ktsSmall(context).copyWith(
                    //               fontSize: 12,
                    //               color: kcWhite,
                    //               fontWeight: FontWeight.w600),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                  ],
                )),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceSmall,
                      RASkeletonLoader(
                        loading: viewModel.isFetchingBusinesses,
                        child: Text(
                          business.name,
                          style: ktsSemibold(context).copyWith(fontSize: 14),
                        ),
                      ),
                      verticalSpaceSmall,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RASkeletonLoader(
                            loading: viewModel.isFetchingBusinesses,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: SvgBuilder(
                                svg: locationSvg,
                                height: 14,
                                color: kcDark700,
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          Flexible(
                            child: RASkeletonLoader(
                              loading: viewModel.isFetchingBusinesses,
                              child: Text(
                                business.addresses.length == 1
                                    ? business.addressName ?? ''
                                    : '${business.addresses.length} locations',
                                maxLines: 2,
                                style: ktsDarkSmall(context)
                                    .copyWith(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceTiny,
                      Row(
                        children: [
                          RASkeletonLoader(
                            loading: viewModel.isFetchingBusinesses,
                            child: Icon(
                              FontAwesomeIcons.waveSquare,
                              size: 13,
                              color: kcDark700,
                            ),
                          ),
                          horizontalSpaceSmall,
                          RASkeletonLoader(
                            loading: viewModel.isFetchingBusinesses,
                            child: Text(
                              getFormattedDistance(business.distance ?? 0),
                              style:
                                  ktsDarkSmall(context).copyWith(fontSize: 12),
                            ),
                          ),
                          horizontalSpaceTiny,
                        ],
                      ),
                      const Spacer(),
                      if (viewModel.activeBusiness?.id == business.id)
                        InkWell(
                          onTap: () => viewModel.launchMapsUrl(
                            business.address!.latitude,
                            business.address!.longitude,
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kcPrimaryColor.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                ),
                              ),
                              child: RASkeletonLoader(
                                loading: viewModel.isFetchingBusinesses,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'Navigate',
                                    style: ktsSmall(context).copyWith(
                                        fontSize: 12,
                                        color: kcWhite,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
