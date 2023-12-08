import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/enums/permission_type.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:bnbit_app/services/permissions_service.dart';
import 'package:bnbit_app/ui/views/home/home_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ScannerViewModel extends BaseViewModel {
  final log = getLogger('ScannerViewModel');
  final _navigationService = locator<NavigationService>();
  final _permissionService = locator<PermissionsService>();
  final _businessService = locator<BusinessService>();
  final _snackbarService = locator<CustomSnackbarService>();

  String? _profileId;
  String? get profileId => _profileId;

  bool get hasProfileId => _profileId != null;
  bool _isScanning = false;
  bool get isScanning => _isScanning;

  void setScanningValue(bool value) {
    _isScanning = value;
    notifyListeners();
  }

  QRViewController? controller;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void navigateToHome() async {
    await _navigationService.clearStackAndShowView(const HomeView());
  }

  void onScann() async {
    if (await _permissionService.checkPermission(PermissionType.camera)) {
      setScanningValue(true);
    }
  }

  void getBusinessById() async {
    if (hasProfileId) {
      try {
        setBusy(true);
        final data = await _businessService.getBusinessById(_profileId!);
        await _navigationService.navigateToBusinessDetailView(business: data);
      } catch (e) {
        log.e('Unable to get business by Id: $e');
      } finally {
        setBusy(false);
      }
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.pauseCamera();
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      log.e(scanData.code.toString());

      final data = scanData.code.toString();
      if (!data.isNullOrEmpty && data.contains('bnbit')) {
        _profileId = data.split('_').last;
        setScanningValue(false);
        getBusinessById();

        controller.dispose();
      } else {
        _snackbarService.showWarning('Not bnbit qr code!');
        controller.resumeCamera();
      }
    });
  }
}
