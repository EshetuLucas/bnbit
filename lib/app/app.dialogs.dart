// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/forgot_password/forgot_password_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/location/location_dialog.dart';
import '../ui/dialogs/open_setting/open_setting_dialog.dart';
import '../ui/dialogs/warning/warning_dialog.dart';

enum DialogType {
  infoAlert,
  openSetting,
  location,
  forgotPassword,
  warning,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.openSetting: (context, request, completer) =>
        OpenSettingDialog(request: request, completer: completer),
    DialogType.location: (context, request, completer) =>
        LocationDialog(request: request, completer: completer),
    DialogType.forgotPassword: (context, request, completer) =>
        ForgotPasswordDialog(request: request, completer: completer),
    DialogType.warning: (context, request, completer) =>
        WarningDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
