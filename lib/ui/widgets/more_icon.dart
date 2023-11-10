import 'package:flutter/material.dart';

import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';

class MoreIcon extends StatelessWidget {
  const MoreIcon({
    Key? key,
    this.onTap,
    this.quarterTurns = -1,
    this.height = 12,
  }) : super(key: key);
  final VoidCallback? onTap;
  final double height;
  final int quarterTurns;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RotatedBox(
        quarterTurns: quarterTurns,
        child: SvgBuilder(
          svg: backSvg,
          height: height,
        ),
      ),
    );
  }
}
