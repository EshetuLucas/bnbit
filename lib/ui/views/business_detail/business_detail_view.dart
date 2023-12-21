import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/image_place_holder.dart';
import 'package:bnbit_app/ui/widgets/map_view.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/ra_skeleton_loader.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/algorithm_helpers.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:bnbit_app/utils/time.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

import 'business_detail_viewmodel.dart';

class BusinessDetailView extends StackedView<BusinessDetailViewModel> {
  const BusinessDetailView({
    Key? key,
    required this.business,
  }) : super(key: key);

  final Business business;

  @override
  void onViewModelReady(BusinessDetailViewModel viewModel) {
    viewModel.onInit();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    BusinessDetailViewModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
      absorbing: viewModel.isBusy,
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _AddressCarousel(
                addresses: viewModel.businessAddress,
                height: 97,
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < business.addresses.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 1),
                      child: Icon(
                        viewModel.selectedAddressIndex == i
                            ? Icons.circle
                            : Icons.circle_outlined,
                        size: viewModel.selectedAddressIndex != i ? 7 : 8,
                        color: viewModel.selectedAddressIndex == i
                            ? kcPrimaryColor
                            : kcDark700,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: business.name,
                tail: Row(
                  children: [
                    if (viewModel.isBusy)
                      const SizedBox(
                        height: 10,
                        child: Spinner(
                          size: 10,
                        ),
                      ),
                    horizontalSpaceSmall,
                    InkWell(
                      onTap: viewModel.onSave,
                      child: SvgBuilder(
                        svg: bookmarkSvg,
                        color:
                            viewModel.isSaved ? kcPrimaryColor : kcDark700Light,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          _BusinessImageCarousel(
                            height: 150,
                            images: [
                              ...business.images.map((e) => e.image).toList(),
                            ],
                          ),

                          // InkWell(
                          //   onTap: viewModel.onClose,
                          //   child: Container(
                          //     margin: const EdgeInsets.only(left: 6),
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       color: kcPrimaryColor.withOpacity(0.8),
                          //     ),
                          //     child: const Padding(
                          //         padding: EdgeInsets.all(6.0),
                          //         child: SvgBuilder(
                          //           svg: backButton,
                          //           color: kcWhite,
                          //           height: 18,
                          //         )),
                          //   ),
                          // )
                        ],
                      ),
                      verticalSpace(2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0;
                              i <
                                  business.images
                                      .map((e) => e.image)
                                      .toList()
                                      .length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: Icon(
                                viewModel.selectedIndex == i
                                    ? Icons.circle
                                    : Icons.circle_outlined,
                                size: viewModel.selectedIndex != i ? 7 : 8,
                                color: viewModel.selectedIndex == i
                                    ? kcPrimaryColor
                                    : kcDark700,
                              ),
                            ),
                        ],
                      ),
                      verticalSpaceSmall,
                      Padding(
                        padding: appSymmetricEdgePadding,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              // Text(
                              //   business.name,
                              //   style:
                              //       ktsSemibold(context).copyWith(fontSize: 16),
                              // ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      business.name,
                                      style: ktsSemibold(context)
                                          .copyWith(fontSize: 16),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        DecoratedContainer(
                                          borderRadius: 4,
                                          withCard: false,
                                          containerColor: viewModel
                                                  .getOperatingHour(business)
                                                  .isNotEmpty
                                              ? kcGreen.withOpacity(0.2)
                                              : kcRed.withOpacity(0.2),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 2),
                                            child: Text(
                                              viewModel
                                                      .getOperatingHour(
                                                          business)
                                                      .isNotEmpty
                                                  ? 'Open'
                                                  : 'Closed',
                                              style:
                                                  ktsSemibold(context).copyWith(
                                                fontSize: 12,
                                                color: viewModel
                                                        .getOperatingHour(
                                                            business)
                                                        .isNotEmpty
                                                    ? kcGreen
                                                    : kcRed,
                                              ),
                                            ),
                                          ),
                                        ),
                                        horizontalSpaceTiny,
                                        if (viewModel
                                            .getOperatingHour(business)
                                            .isNotEmpty)
                                          Text(
                                            ': Closes at ${viewModel.getOperatingHour(business)}',
                                            style: ktsSmall(context)
                                                .copyWith(fontSize: 12),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              verticalSpaceSmall,
                              verticalSpaceTiny,
                              Text(
                                business.description,
                                style: ktsSmall(context)
                                    .copyWith(fontSize: 12, color: kcDark),
                              ),
                              verticalSpaceSmall,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SvgBuilder(
                                      svg: locationSvg,
                                      height: 16,
                                      color: kcDark700,
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  Flexible(
                                    child: Text(
                                      business.addresses.length == 1
                                          ? business.addresses.first.label ??
                                              business.addresses.first
                                                  .displayAddress
                                          : '${business.addresses.length} locations',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: ktsDarkSmall(context)
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpaceTiny,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  horizontalSpaceSmall,
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Icon(
                                      FontAwesomeIcons.waveSquare,
                                      size: 13,
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  horizontalSpaceSmall,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      getFormattedDistance(viewModel.distance(
                                          viewModel.businessAddress.first)),
                                      style: ktsDarkSmall(context).copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  if (business.addresses.length > 1)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        'Nearest',
                                        style: ktsDarkSmall(context).copyWith(
                                          fontSize: 12,
                                          color: kcPrimaryColor,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              verticalSpaceMedium,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: InkWell(
                                      onTap: () => viewModel.makePhoneCall(
                                          business.addresses.first
                                                  .phone_number ??
                                              ''),
                                      child: Column(
                                        children: [
                                          const SvgBuilder(
                                            svg: callSvg,
                                            height: 22,
                                          ),
                                          Text(
                                            'Call',
                                            style: ktsDarkSmall(context)
                                                .copyWith(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceMedium,
                                  if (!business.website.isNullOrEmpty)
                                    Flexible(
                                      child: InkWell(
                                        onTap: () => viewModel
                                            .openLink(business.website!),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.globe,
                                              color: kcPrimaryColor,
                                              size: 20,
                                            ),
                                            Text(
                                              'Website',
                                              style: ktsDarkSmall(context)
                                                  .copyWith(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  horizontalSpaceMedium,
                                  if (!business.instagram.isNullOrEmpty)
                                    Flexible(
                                      child: InkWell(
                                        onTap: () => viewModel
                                            .openLink(business.instagram!),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.instagram,
                                              color: kcPrimaryColor,
                                              size: 20,
                                            ),
                                            Text(
                                              'Instagram',
                                              style: ktsDarkSmall(context)
                                                  .copyWith(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  horizontalSpaceMedium,
                                  if (!business.telegram.isNullOrEmpty)
                                    Flexible(
                                      child: InkWell(
                                        onTap: () => viewModel
                                            .openLink(business.telegram!),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.telegram,
                                              color: kcPrimaryColor,
                                              size: 20,
                                            ),
                                            Text(
                                              'Telegram',
                                              style: ktsDarkSmall(context)
                                                  .copyWith(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              verticalSpaceSmall,
                              verticalSpaceTiny,
                              if (business.services.isNotEmpty)
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Services',
                                        style: ktsSmall(context).copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: kcPrimaryColor,
                                        ),
                                      ),
                                      verticalSpaceTiny,
                                      if (business.services.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Wrap(
                                            spacing: 4,
                                            runSpacing: 6,
                                            children: business.services
                                                .map(
                                                  (service) => Wrap(
                                                    spacing: 4,
                                                    runSpacing: 6,
                                                    children: [
                                                      DecoratedContainer(
                                                        // onTap: viewModel.onAddAddress,
                                                        borderRadius: 30,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 8),
                                                          child: Text(
                                                            service.service,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: ktsSmall(
                                                                context),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              if (business.opening_hours.isNotEmpty)
                                const _OperatingHoursWidget()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  BusinessDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BusinessDetailViewModel(business: business);
}

class _BusinessImageCarousel extends ViewModelWidget<BusinessDetailViewModel> {
  final double height;

  final List<String> images;

  const _BusinessImageCarousel(
      {Key? key, required this.height, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context, BusinessDetailViewModel viewModel) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        aspectRatio: 2.0,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        enlargeFactor: 0.2,
        onPageChanged: (index, reason) =>
            viewModel.setSelectedImageIndex(index),
      ),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              height: 145,
              child: DecoratedContainer(
                onTap: () => viewModel.onImageTap(images.indexOf(image)),
                borderRadius: 1,
                child: PlaceholderImage(
                  placeHolder: const ImagePlaceHolder(),
                  roundedCorners: false,
                  fit: BoxFit.cover,
                  imageUrl: baseUrl + '/' + image,
                  errorImageUrl: placeHolderImage,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class _AddressCarousel extends ViewModelWidget<BusinessDetailViewModel> {
  final double height;

  final List<Address> addresses;

  const _AddressCarousel(
      {Key? key, required this.height, required this.addresses})
      : super(key: key);

  @override
  Widget build(BuildContext context, BusinessDetailViewModel viewModel) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 109,
        aspectRatio: 2.0,
        viewportFraction: 0.82,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        enlargeFactor: 0.2,
        onPageChanged: (index, reason) => viewModel.onChangeAddres(
          addresses[index],
          index,
        ),
      ),
      items: addresses.map((address) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: DecoratedContainer(
                elevation: 0,
                shadowColor: kcDark,
                containerColor: kcWhite,
                borderRadius: 8,
                borderColor: kcLightGrey.withOpacity(0.3),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceSmall,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 8),
                                child: SvgBuilder(
                                  svg: locationSvg,
                                  height: 16,
                                  color: kcDark700Light,
                                ),
                              ),
                              horizontalSpaceSmall,
                              Flexible(
                                child: Text(
                                  address.label ?? address.displayAddress,
                                  maxLines: 1,
                                  style: ktsDarkSmall(context).copyWith(
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Row(
                            children: [
                              horizontalSpaceSmall,
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Icon(
                                  FontAwesomeIcons.waveSquare,
                                  size: 12,
                                  color: kcDark700Light,
                                ),
                              ),
                              horizontalSpaceSmall,
                              horizontalSpaceSmall,
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  getFormattedDistance(
                                      viewModel.distance(address)),
                                  style: ktsDarkSmall(context).copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                horizontalSpaceSmall,
                                InkWell(
                                  onTap: () => viewModel.makePhoneCall(
                                      address.phone_number ?? ''),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: SvgBuilder(
                                          svg: callSvg,
                                          color: kcDark700Light,
                                          height: 17,
                                        ),
                                      ),
                                      horizontalSpaceSmall,
                                      horizontalSpaceTiny,
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          address.phone_number ?? '',
                                          style: ktsDarkSmall(context).copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                if (viewModel.selectedAddressIndex ==
                                    addresses.indexOf(address))
                                  InkWell(
                                    onTap: () => viewModel.launchMapsUrl(
                                      address.latitude,
                                      address.longitude,
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              kcPrimaryColor.withOpacity(0.8),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                          ),
                                        ),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class MapView extends ViewModelWidget<BusinessDetailViewModel> {
  const MapView({
    Key? key,
    required this.business,
  }) : super(key: key);
  final Business business;
  @override
  Widget build(BuildContext context, BusinessDetailViewModel viewModel) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: GoogleMapPage(
        markers: viewModel.getMarkers(
          latlngs: viewModel.business.addresses
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList(),
          currentLocation: LatLng(
            viewModel.currentLocation.latitude,
            viewModel.currentLocation.longitude,
          ),
        ),
        lat: business.addresses.last.latitude,
        long: business.addresses.last.longitude,
        latlngs: viewModel.business.addresses
            .map(
              (e) => LatLng(e.latitude, e.longitude),
            )
            .toList(),
        cameraTarget: LatLng(
          business.addresses.last.latitude,
          business.addresses.last.longitude,
        ),
        zoom: 16,
        onMapCreated: viewModel.onMapCreated,
      ),
    );
  }
}

class _OperatingHoursWidget extends ViewModelWidget<BusinessDetailViewModel> {
  const _OperatingHoursWidget();

  @override
  Widget build(BuildContext context, BusinessDetailViewModel viewModel) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      verticalSpaceSmall,
      Text(
        'Operating hours',
        style: ktsSmall(context).copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: kcPrimaryColor,
        ),
      ),
      verticalSpaceTiny,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                //  viewModel.todayOperatingHour.keys.first,
                viewModel.todayOperatingHour.isNotEmpty
                    ? 'Today'
                    : "Closed today",
                style: ktsSmall(context).copyWith(
                  fontSize: 13,
                  color: kcDarkGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: viewModel.onMoreIconTap,
                child: Text(
                  viewModel.todayOperatingHour.isNotEmpty
                      ? '${viewModel.todayOperatingHour.values.first!.startTime.format(context)} - ${viewModel.todayOperatingHour.values.first!.endTime.format(context)}'
                      : !viewModel.showAllOperatingHours
                          ? 'See more'
                          : 'See less',
                  style: ktsSmall(context).copyWith(
                    fontSize: 13,
                    color: kcDarkGrey,
                  ),
                ),
              ),
              horizontalSpaceSmall,
              InkWell(
                onTap: viewModel.onMoreIconTap,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    viewModel.showAllOperatingHours
                        ? Icons.expand_less
                        : Icons.expand_more,
                    color: kcDark700Light,
                  ),
                ),
              )
            ],
          ),
          verticalSpaceTiny,
          if (viewModel.showAllOperatingHours)
            ...TimeUtil.convertOperatingHoursToTimeRanges(
                    viewModel.business.opening_hours)
                .entries
                .map(
                  (tradingHourEntry) => Column(
                    children: [
                      verticalSpaceSmall,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tradingHourEntry.key,
                            style: ktsSmall(context).copyWith(
                              fontSize: 12,
                              color: kcDarkGrey,
                            ),
                          ),
                          Text(
                            '${tradingHourEntry.value!.startTime.format(context)} - ${tradingHourEntry.value!.endTime.format(context)}',
                            style: ktsSmall(context).copyWith(
                              fontSize: 12,
                              color: kcDarkGrey,
                            ),
                          )
                        ],
                      ),
                      verticalSpaceSmall,
                      const Divider(),
                    ],
                  ),
                )
                .toList(),
        ]),
      ),
    ]);
  }
}
