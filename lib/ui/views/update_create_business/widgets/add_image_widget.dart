
import 'dart:io';

import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/update_create_business/update_create_business_viewmodel.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/image_place_holder.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'section_title.dart';

class AddImageWidget extends ViewModelWidget<UpdateCreateBusinessViewModel> {
  const AddImageWidget({super.key, 
    required this.hasBusiness,
    required this.images,
  });
  final bool hasBusiness;
  final List<String> images;

  @override
  Widget build(BuildContext context, UpdateCreateBusinessViewModel viewModel) {
    return hasBusiness
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SectionTitle('Photo Gallery'),
                  const Spacer(),
                  InkWell(
                    onTap: viewModel.onEditGallery,
                    child: const SvgBuilder(
                      svg: editSvg,
                      color: kcPrimaryColor,
                    ),
                  )
                ],
              ),
              verticalSpaceSmall,
              SizedBox(
                height: 85,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 85,
                      width: 85,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: DecoratedContainer(
                        borderRadius: 8,
                        withCard: true,
                        child: PlaceholderImage(
                          placeHolder: const ImagePlaceHolder(),
                          roundedCorners: false,
                          fit: BoxFit.cover,
                          imageUrl: baseUrl + '/' + images[index],
                          errorImageUrl: placeHolderImage,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : SizedBox(
            height: 120,
            width: screenWidth(context),
            child: viewModel.selectedFile != null
                ? InkWell(
                    onTap: viewModel.onAddImage,
                    child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: kcDark700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      elevation: 1,
                      child: Image.file(
                        File(viewModel.selectedFile!.path),
                        fit: BoxFit.cover,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) =>
                                frame == null
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: Shimmer.fromColors(
                                          baseColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.99),
                                          highlightColor: Theme.of(context)
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
                    ),
                  )
                : InkWell(
                    onTap: viewModel.onAddImage,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const [6, 3],
                      radius: const Radius.circular(1),
                      strokeWidth: 0.3,
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.add,
                            color: kcPrimaryColor,
                            size: 20,
                          ),
                          horizontalSpaceSmall,
                          Text(
                            'Add cover image',
                            style: ktsSmall(context)
                                .copyWith(color: kcPrimaryColor),
                          ),
                        ],
                      )),
                    ),
                  ),
          );
  }
}