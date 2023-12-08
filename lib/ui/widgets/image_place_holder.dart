import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: kcPrimaryColor.withOpacity(0.28),
      child: Shimmer.fromColors(
        baseColor: kcPrimaryColor.withOpacity(0.2),
        highlightColor: kcPrimaryColor.withOpacity(0.1),
        child: const ImageBuilder(
          fit: BoxFit.cover,
          height: 160,
          imagePath: iconImage,
        ),
        enabled: true,
      ),
    );
  }
}
