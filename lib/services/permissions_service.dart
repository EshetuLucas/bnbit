import 'dart:io';

import 'package:bnbit_app/app/app.dialogs.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/enums/permission_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class PermissionsService {
  final log = getLogger('PermissionsService');
  final _dialogService = locator<DialogService>();

  bool isIOS = true;

  Future<bool> checkPermission(PermissionType permissionType) async {
    isIOS = Platform.isIOS;

    log.i('permissionType: $permissionType');

    PermissionStatus permissionStatus =
        await getPermissionStatus(permissionType);

    if (permissionStatus == PermissionStatus.denied) {
      return false;
    } else if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else if (permissionStatus == PermissionStatus.limited) {
      return true;
    } else {
      if (PermissionType.pushNotification != permissionType) {
        await showPhotoPermissionDialog();
      }
      return false;
    }
  }

  Future<bool> hasPermission(PermissionType permissionType) async {
    isIOS = Platform.isIOS;

    log.i('permissionType: $permissionType');

    switch (permissionType) {
      case PermissionType.contacts:
        final status = await Permission.contacts.status;
        if (status == PermissionStatus.denied) {
          return false;
        }

        break;

      case PermissionType.camera:
        final status = await Permission.camera.status;
        if (status == PermissionStatus.denied) {
          return false;
        }

        break;

      default:
        return true;
    }
    return true;
  }

  Future<PermissionStatus> getPermissionStatus(
      PermissionType permissionType) async {
    DeviceInfoPlugin? deviceInfo = !isIOS ? DeviceInfoPlugin() : null;
    AndroidDeviceInfo? androidInfo =
        !isIOS ? await deviceInfo?.androidInfo : null;
    log.i('permissionType: $permissionType');
    switch (permissionType) {
      case PermissionType.pushNotification:
        if (isIOS) {
          return await Permission.notification.request();
        } else if (androidInfo!.version.sdkInt >= 33) {
          return await Permission.notification.request();
        } else {
          return PermissionStatus.granted;
        }
      case PermissionType.camera:
        return await Permission.camera.request();
      case PermissionType.contacts:
        return await Permission.contacts.request();
      case PermissionType.media:
        if (isIOS) {
          return await Permission.photos.request();
        } else {
          if (androidInfo!.version.sdkInt >= 33) {
            return await Permission.photos.request();
          } else {
            return await Permission.storage.request();
          }
        }
      default:
        return PermissionStatus.granted;
    }
  }

  Future<void> showPhotoPermissionDialog() async {
    final result = await _dialogService.showCustomDialog(
        variant: DialogType.openSetting,
        title: '',
        additionalButtonTitle: 'okay'.tr,
        description: 'enable_permission'.tr);
    log.v(result?.confirmed);
    if (result?.confirmed ?? false) {
      log.e('message');
      await openAppSettings();
    } else {
      log.v('User taps Okay, we do nothing');
    }
  }
}
