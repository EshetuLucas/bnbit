import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
    this.title = 'Unable to fetch business\nPlease try again!',
    this.buttonTitle = 'Tap to try again',
    this.onTap,
    this.subTitle = '',
  });
  final String title;
  final VoidCallback? onTap;
  final String subTitle;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SvgBuilder(
                height: 50,
                svg: noResult,
              ),
              verticalSpaceSmall,
              Text(
                title,
                style: ktsSemibold(context).copyWith(
                  color: kcDark,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpaceTiny,
              Text(
                subTitle,
                style: ktsSmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
              if (onTap != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AbsorbPointer(
                    absorbing: true,
                    child: AppButton(
                      backgroundColor: kcTransparent,
                      isOutlined: true,
                      textColor: Theme.of(context).colorScheme.surface,
                      title: buttonTitle,
                      onTap: onTap ?? () => {},
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
