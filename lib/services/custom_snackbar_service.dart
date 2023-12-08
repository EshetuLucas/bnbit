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
      messageText: const _BasicSanckbarWidget(
        title: 'Double tap to exit the app',
      ),
    );
  }

  Future<void> showError(
    String? message, {
    Duration? duration,
  }) async {
    basicSnackBar(
      messageText: _BasicSanckbarWidget(
        containerColor: kcRed.withOpacity(0.9),
        title: message?.tr ?? 'Something went wrong! Try again',
      ),
    );
  }

  Future<void> noInternetSnackbarConfig({
    String? message,
  }) async {
    basicSnackBar(
      messageText: _BasicSanckbarWidget(
        title: 'needs_internet'.tr,
        icon: const Icon(
          Icons.wifi_off,
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  Future<void> comingSoon({
    String? message,
  }) async {
    basicSnackBar(
      messageText: _BasicSanckbarWidget(
        title: 'Working on this feature'.tr,
      ),
    );
  }

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

  Future<void> showImageSaved(String title) async {
    basicSnackBar(
      messageText: _BasicSanckbarWidget(
        title: title.tr,
      ),
    );
  }

  Future<void> showSuccess(String title) async {
    basicSnackBar(
      messageText: _BasicSanckbarWidget(
        icon: const Icon(
          Icons.check_circle,
          color: kcWhite,
        ),
        title: title.tr,
      ),
    );
  }

  Future<void> showWarning(String title) async {
    basicSnackBar(
      messageText: _BasicSanckbarWidget(
        icon: const Icon(
          Icons.warning,
          color: Colors.orange,
        ),
        title: title.tr,
      ),
    );
  }
}

class _BasicSanckbarWidget extends StatelessWidget {
  const _BasicSanckbarWidget({
    required this.title,
    this.icon,
    this.containerColor,
  });

  final String title;
  final Widget? icon;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedContainer(
            borderColor: kcTransparent,
            containerColor: containerColor ?? kcDark.withOpacity(0.7),
            shadowColor: kcDark700.withOpacity(0.6),
            shadowOpacity: 0.01,
            borderRadius: 4,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  horizontalSpaceSmall,
                  if (icon != null) icon!,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, bottom: 3),
                      child: Text(
                        title,
                        style: ktsSmall(context).copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).colorScheme.outlineVariant),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => getx.Get.closeAllSnackbars(),
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  horizontalSpaceTiny,
                ],
              ),
            ),
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}
