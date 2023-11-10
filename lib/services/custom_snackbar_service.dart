import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:flutter/material.dart';

import '../app/app.logger.dart';
import 'package:get/get.dart' as getx;

import '../ui/common/app_colors.dart';

class CustomSnackbarService {
  final log = getLogger('CustomSnackbarService');

  Future<void> showExitAppMessage(
    String message, {
    Duration? duration,
  }) async {
    basicSnackBar(
      messageText: _BasicSanckbarWidget(
        title: 'double_tap'.tr,
        icon: DecoratedContainer(borderRadius: 100, child: Container()

            // ImageBuilder(
            //   imagePath: iconPng,
            //   height: 30,
            // ),
            ),
      ),
    );
  }

  Future<void> noInternetSnackbarConfig({
    String? message,
  }) async {
    basicSnackBar(
      messageText: _BasicSanckbarWidget(
        title: 'needs_internet'.tr,
        icon: const DecoratedContainer(
          borderRadius: 100,
          child: Icon(
            Icons.wifi_off,
            color: kcPrimaryColor,
          ),
        ),
      ),
    );
  }

  // Future<void> comingSoon({
  //   String? message,
  // }) async {
  //   basicSnackBar(
  //     messageText: _BasicSanckbarWidget(
  //       title: 'coming_soon'.tr,
  //       icon: const DecoratedContainer(
  //         borderRadius: 100,
  //         child: DecoratedContainer(
  //           borderRadius: 100,
  //           child: ImageBuilder(
  //             imagePath: iconPng,
  //             height: 30,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void basicSnackBar({
    String? title,
    required Widget messageText,
  }) {
    getx.Get.snackbar(
      "",
      "",
      barBlur: 0,
      padding: EdgeInsets.zero,
      isDismissible: true,
      snackPosition: getx.SnackPosition.BOTTOM,
      backgroundColor: kcTransparent,
      duration: const Duration(seconds: 3),
      messageText: messageText,
    );
  }

  // _snackbarService.showCustomSnackBar(
  //   variant: SnackbarType.imageSaved,
  //   message: '',
  //   duration: const Duration(seconds: 2),
  // );
}

class _BasicSanckbarWidget extends StatelessWidget {
  const _BasicSanckbarWidget({
    required this.title,
    required this.icon,
  });

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedContainer(
          withCard: false,
          containerColor:
              Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
          shadowColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
          borderColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
          shadowOpacity: 0.01,
          borderRadius: 4,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                horizontalSpaceSmall,
                icon,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      title,
                      style: ktsWhiteMediumTextStyle(context).copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => getx.Get.closeAllSnackbars(),
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}
