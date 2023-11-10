import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';

import 'image_builder.dart';

class AmakariErrorWidget extends StatelessWidget {
  const AmakariErrorWidget({
    Key? key,
    required this.onTap,
    this.errorMessage =
        'We are unable to fetch posts.\nPlease tap to try again',
    this.imagePath,
  }) : super(key: key);

  final VoidCallback onTap;
  final String errorMessage;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                children: [
                  Expanded(
                      child: ImageBuilder(
                          imagePath: imagePath ?? 'assets/images/timeout.png')),
                  Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: ktsMediumDarkTextStyle(context).copyWith(
                      color: kcDeepBlue,
                    ),
                  ),
                  verticalSpaceSmall,
                  Icon(
                    CupertinoIcons.refresh,
                    color: Theme.of(context).colorScheme.primary,
                    size: 60,
                  ),
                  verticalSpaceMassive,
                  verticalSpaceLarge
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
