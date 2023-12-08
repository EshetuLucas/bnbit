import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';

class SocialloginWidget extends StatelessWidget {
  const SocialloginWidget({
    Key? key,
    this.googleSvgColor,
    this.appleSvgColor,
    this.facebookSvgColor,
    this.size = 50,
    this.backgroundColor,
    this.onGoogleSign,
    this.onAppleSign,
    this.onFacebookSign,
    this.onEmailSign,
    required this.isAppleSignInAvailable,
  }) : super(key: key);

  final Color? googleSvgColor;
  final Color? appleSvgColor;
  final Color? facebookSvgColor;
  final Color? backgroundColor;
  final double size;
  final bool isAppleSignInAvailable;
  final VoidCallback? onGoogleSign;
  final VoidCallback? onAppleSign;
  final VoidCallback? onFacebookSign;
  final VoidCallback? onEmailSign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialLogin(
          svg: emailSvg,
          onTap: onEmailSign,
          svgColor: kcPrimaryColor,
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.outlineVariant,
          size: size,
          svgSizePadding: 7,
        ),
        horizontalSpaceSmall,
        _SocialLogin(
          svg: googleSvg,
          onTap: onGoogleSign,
          svgColor: googleSvgColor,
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.outlineVariant,
          size: size,
        ),
        if (isAppleSignInAvailable) ...[
          horizontalSpaceSmall,
          _SocialLogin(
            svg: appleSvg,
            onTap: onAppleSign,
            svgColor: appleSvgColor,
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.outlineVariant,
            size: size,
          ),
        ],
        horizontalSpaceSmall,
        // _SocialLogin(
        //   svg: facebook,
        //   onTap: onFacebookSign,
        //   svgColor: facebookSvgColor,
        //   backgroundColor: backgroundColor,
        //   size: size,
        // ),
      ],
    );
  }
}

class _SocialLogin extends StatelessWidget {
  const _SocialLogin(
      {Key? key,
      required this.svg,
      this.onTap,
      this.svgColor,
      this.size = 50,
      this.svgSizePadding = 10,
      this.backgroundColor})
      : super(key: key);

  final String svg;
  final VoidCallback? onTap;
  final Color? svgColor;
  final Color? backgroundColor;
  final double size;
  final double svgSizePadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: kdbDefaultBoxDecoration.copyWith(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: backgroundColor ?? Theme.of(context).colorScheme.tertiary),
        child: Padding(
          padding: EdgeInsets.all(svgSizePadding),
          child: SvgBuilder(
            svg: svg,
            color: svgColor,
          ),
        ),
      ),
    );
  }
}
