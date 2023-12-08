import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_back_button.dart';

import '../common/shared_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.onBack,
    this.textStyle,
    this.hasBackButton = true,
    this.hasDivider = true,
    this.tail,
    this.hasPadding = true,
  }) : super(key: key);
  final String title;
  final VoidCallback? onBack;
  final TextStyle? textStyle;
  final bool hasBackButton;
  final bool hasDivider;
  final Widget? tail;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Theme.of(context).colorScheme.tertiary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpaceTiny,
          Padding(
            padding: hasPadding ? appSymmetricEdgePadding : EdgeInsets.zero,
            child: Row(
              children: [
                if (hasBackButton) ...[
                  AppBackButton(
                    onTap: onBack,
                  ),
                  horizontalSpace(20),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: textStyle ??
                        ktsSemibold(context).copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
                if (tail != null) tail!
              ],
            ),
          ),
          if (hasDivider)
            const Divider(
              color: kcBorderColor,
            ),
        ],
      ),
    );
  }
}
