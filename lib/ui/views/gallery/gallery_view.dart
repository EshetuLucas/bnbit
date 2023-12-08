import 'dart:io';

import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/image_place_holder.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'gallery_viewmodel.dart';

class GalleryView extends StackedView<GalleryViewModel> {
  const GalleryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GalleryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const CustomAppBar(
            //   title: 'Gallery',
            // ),
            verticalSpaceSmall,
            verticalSpaceTiny,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Text(
                'Gallery',
                style: ktsSmall(context).copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: kcPrimaryColor),
              ),
            ),
            verticalSpaceSmall,
            verticalSpaceSmall,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 14,
                runSpacing: 14,
                children: [
                  SizedBox(
                    height: 85,
                    width: 85,
                    child: DecoratedContainer(
                      onTap: viewModel.uploadImage,
                      borderRadius: 8,
                      withCard: true,
                      child: viewModel.selectedFile != null
                          ? Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.file(
                                  File(viewModel.selectedFile!.path),
                                  fit: BoxFit.cover,
                                  frameBuilder: (context, child, frame,
                                          wasSynchronouslyLoaded) =>
                                      frame == null
                                          ? Container(
                                              alignment: Alignment.center,
                                              // color: Theme.of(context).colorScheme. primary,
                                              child: Shimmer.fromColors(
                                                baseColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withOpacity(0.99),
                                                highlightColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .tertiary,
                                                child: const ImageBuilder(
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                  imagePath: iconImage,
                                                ),
                                                enabled: true,
                                              ),
                                            )
                                          : child,
                                ),
                                if (viewModel.isBusy)
                                  Container(
                                    color: kcLightWhite.withOpacity(0.8),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                          child: Spinner(
                                            size: 10,
                                            color: kcPrimaryColor,
                                          ),
                                        ),
                                        verticalSpaceTiny,
                                        Text(
                                          'Uploading',
                                          style: ktsSmall(context)
                                              .copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            )
                          : DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: const [5, 3],
                              radius: const Radius.circular(1),
                              strokeWidth: 0.3,
                              child: Center(
                                  child: Icon(
                                Icons.add,
                                color: kcDark700.withOpacity(0.6),
                                size: 30,
                              )),
                            ),
                    ),
                  ),
                  ...viewModel.selectedBusiness!.images
                      .map(
                        (image) => DecoratedContainer(
                          key: Key(image.id),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 85,
                                width: 85,
                                child: DecoratedContainer(
                                  onTap: () => viewModel.onImageTap(image),
                                  borderRadius: 8,
                                  withCard: true,
                                  child: PlaceholderImage(
                                    placeHolder: const ImagePlaceHolder(),
                                    roundedCorners: false,
                                    fit: BoxFit.cover,
                                    imageUrl: baseUrl + '/' + image.image,
                                    errorImageUrl: placeHolderImage,
                                  ),
                                ),
                              ),
                              if (viewModel.isImageBusy(image.id))
                                Container(
                                  height: 85,
                                  width: 85,
                                  color: kcLightWhite.withOpacity(0.8),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                        child: Spinner(
                                          size: 10,
                                          color: kcPrimaryColor,
                                        ),
                                      ),
                                      verticalSpaceTiny,
                                      Text(
                                        'Processing',
                                        style: ktsSmall(context)
                                            .copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  GalleryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GalleryViewModel();
}
