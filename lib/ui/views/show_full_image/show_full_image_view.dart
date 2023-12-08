import 'dart:io';

import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/image_builder.dart';
import 'show_full_image_viewmodel.dart';

class ShowFullImageView extends StackedView<ShowFullImageViewModel> {
  const ShowFullImageView({
    Key? key,
    required this.imagePath,
    this.isFromFile = true,
  }) : super(key: key);
  final String imagePath;
  final bool isFromFile;

  @override
  Widget builder(
    BuildContext context,
    ShowFullImageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kcPrimaryColor,
        onPressed: () =>
            viewModel.isBusy ? () => {} : viewModel.onDownloadImage(imagePath),
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
        child: GestureDetector(
          child: Center(
            child: InteractiveViewer(
              maxScale: 5,
              child: !isFromFile
                  ? Align(
                      alignment: Alignment.center,
                      child: PlaceholderImage(
                        errorImageUrl: '',
                        imageUrl: imagePath,
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
                    )
                  : Hero(
                      tag: 'imageHero',
                      child: Image.file(
                        File(imagePath),
                        fit: BoxFit.contain,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) =>
                                frame == null
                                    ? Container(
                                        alignment: Alignment.center,
                                        // color: Theme.of(context).colorScheme. primary,
                                        child: Shimmer.fromColors(
                                          baseColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.99),
                                          highlightColor: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          child: const ImageBuilder(
                                            fit: BoxFit.cover,
                                            imagePath: iconImage,
                                          ),
                                          enabled: true,
                                        ),
                                      )
                                    : child,
                      )),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  ShowFullImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShowFullImageViewModel();
}
