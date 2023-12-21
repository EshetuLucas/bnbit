import 'dart:io';

import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/image_place_holder.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/image_builder.dart';

import 'view_images_viewmodel.dart';

class ViewImagesView extends StackedView<ViewImagesViewModel> {
  const ViewImagesView({
    Key? key,
    required this.images,
    this.index = 0,
  }) : super(key: key);
  final List<String> images;
  final int index;

  @override
  Widget builder(
    BuildContext context,
    ViewImagesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kcPrimaryColor,
        onPressed: () =>
            viewModel.isBusy ? () => {} : viewModel.onDownloadImage(),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: viewModel.isBusy
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: Spinner(
                    size: 10,
                    color: kcWhite,
                  ),
                )
              : Icon(
                  Icons.download,
                  color: Theme.of(context).colorScheme.outlineVariant,
                  size: 26,
                ),
        ),
      ),
      body: SafeArea(
          right: false,
          left: false,
          child: Column(
            children: [
              CustomAppBar(
                title: viewModel.appBartitle,
              ),
              Expanded(
                child: Center(
                  child: _BusinessImageCarousel(
                      height: screenHeight(context), images: images),
                ),
              ),
            ],
          )

          // GestureDetector(
          //   child: Center(
          //     child: InteractiveViewer(
          //       maxScale: 5,
          //       child: Align(
          //         alignment: Alignment.center,
          //         child: PlaceholderImage(
          //           errorImageUrl: '',
          //           imageUrl: viewModel.currentImageUrl,
          //           fit: BoxFit.contain,
          //           cornerRadius: 0,
          //           showGreyBackground: false,
          //           placeHolder: Container(
          //             alignment: Alignment.center,
          //             color: Theme.of(context).colorScheme.primary,
          //             child: Shimmer.fromColors(
          //               baseColor: Theme.of(context).colorScheme.primary,
          //               highlightColor:
          //                   Theme.of(context).colorScheme.onBackground,
          //               child: const ImageBuilder(
          //                   fit: BoxFit.cover,
          //                   imagePath: 'assets/images/icon.png'),
          //               enabled: true,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ),
    );
  }

  @override
  ViewImagesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewImagesViewModel(images, index);
}

class _BusinessImageCarousel extends ViewModelWidget<ViewImagesViewModel> {
  final double height;

  final List<String> images;

  const _BusinessImageCarousel(
      {Key? key, required this.height, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context, ViewImagesViewModel viewModel) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        aspectRatio: 2.0,
        viewportFraction: 1,
        initialPage: viewModel.currentImageUrl,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        enlargeFactor: 0,
        onPageChanged: (index, reason) => viewModel.onChangeImage(index),
      ),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return DecoratedContainer(
              // onTap: () => viewModel.onImageTap(baseUrl + '/' + image),
              borderRadius: 0,
              borderColor: kcWhite,
              elevation: 0,
              child: InteractiveViewer(
                maxScale: 5,
                child: Align(
                  alignment: Alignment.center,
                  child: PlaceholderImage(
                    errorImageUrl: '',
                    imageUrl: baseUrl + '/' + image,
                    fit: BoxFit.contain,
                    cornerRadius: 0,
                    showGreyBackground: false,
                    placeHolder: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).colorScheme.primary,
                      child: Shimmer.fromColors(
                        baseColor: Theme.of(context).colorScheme.primary,
                        highlightColor:
                            Theme.of(context).colorScheme.onBackground,
                        child: const ImageBuilder(
                            fit: BoxFit.cover,
                            imagePath: 'assets/images/icon.png'),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
