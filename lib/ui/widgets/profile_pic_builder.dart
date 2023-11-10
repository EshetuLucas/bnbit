import 'package:flutter/material.dart';

import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/widgets/ra_skeleton_loader.dart';

import 'placeholder_image.dart';

class ProfilePicBuilder extends StatelessWidget {
  const ProfilePicBuilder({
    required this.url,
    this.size = 100,
    this.loading = false,
    this.textStyle,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.fit = BoxFit.cover,
    this.radius = 200,
    Key? key,
  }) : super(key: key);
  final String url;
  final double size;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool loading;
  final EdgeInsetsGeometry padding;
  final BoxFit fit;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: RASkeletonLoader(
        loading: loading,
        child: SizedBox(
          height: size,
          width: size,
          child: !url.contains('http')
              ? Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: padding,
                    child: Text(
                      url,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          ktsBoldTextStyle(context).copyWith(
                            fontSize: 18,
                          ),
                    ),
                  ),
                )
              : PlaceholderImage(
                  cornerRadius: radius,
                  imageUrl: url,
                  fit: fit,
                  showGreyBackground: false,
                  roundedCorners: true,
                  errorImageUrl: '',
                ),
        ),
      ),
    );
  }
}
