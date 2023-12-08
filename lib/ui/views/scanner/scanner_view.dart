import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'scanner_viewmodel.dart';

class ScannerView extends StackedView<ScannerViewModel> {
  ScannerView({Key? key}) : super(key: key);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget builder(
    BuildContext context,
    ScannerViewModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
      absorbing: viewModel.isBusy,
      child: Scaffold(
        body: !viewModel.isScanning
            ? SafeArea(
                child: InkWell(
                  onTap: viewModel.onScann,
                  child: Padding(
                    padding: appSymmetricEdgePadding,
                    child: Center(
                      child: viewModel.isBusy
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.qr_code_2,
                                    size: screenHeight(context) / 6,
                                  ),
                                ),
                                verticalSpaceSmall,
                                Text(
                                  'Getting profile',
                                  style: ktsSemibold300(context).copyWith(
                                    color: kcDark700,
                                    fontSize: 16,
                                  ),
                                ),
                                verticalSpaceSmall,
                                const SizedBox(
                                  height: 25,
                                  child: Spinner(),
                                ),
                                verticalSpaceLarge,
                              ],
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.qr_code_scanner_rounded,
                                    size: screenHeight(context) / 6,
                                    color: kcPrimaryColor,
                                  ),
                                ),
                                verticalSpaceSmall,
                                Text(
                                  'Tap to Scann',
                                  style: ktsSemibold300(context).copyWith(
                                    color: kcDark700,
                                    fontSize: 16,
                                  ),
                                ),
                                verticalSpaceLarge,
                              ],
                            ),
                    ),
                  ),
                ),
              )
            : QRView(
                key: qrKey,
                onQRViewCreated: viewModel.onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderLength: 20,
                  borderRadius: 8,
                  borderColor: kcPrimaryColor,
                ),
              ),
      ),
    );
  }

  @override
  ScannerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScannerViewModel();
}
