import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    this.onTap,
    this.padding,
  }) : super(key: key);
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SvgBuilder(
          svg: backButton,
          color: kcDark.withOpacity(0.9),
        ),
      ),
    );
  }
}
