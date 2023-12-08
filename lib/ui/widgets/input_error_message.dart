import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';

class ValidationMessage extends StatelessWidget {
  const ValidationMessage({
    Key? key,
    required this.title,
    this.textStyle,
  }) : super(key: key);
  final String title;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle ??
                ktsSmallWhiteTextStyle(context).copyWith(
                  fontSize: 11,
                  color: kcRed.withOpacity(0.9),
                ),
          )
        ],
      ),
    );
  }
}
