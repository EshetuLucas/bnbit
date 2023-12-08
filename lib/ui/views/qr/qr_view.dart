import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';

import 'qr_viewmodel.dart';

class QrView extends StackedView<QrViewModel> {
  QrView({Key? key, this.business}) : super(key: key);

  final Business? business;

  final GlobalKey qrKey = GlobalKey();

  @override
  Widget builder(
    BuildContext context,
    QrViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Manage QR Code',
                hasPadding: false,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      business!.name,
                      style: ktsMediumDarkTextStyle(context).copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kcDark,
                      ),
                    ),
                    verticalSpaceTiny,
                    Text(
                      '@ ' + business!.name,
                      style: ktsMediumDarkTextStyle(context).copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                        color: kcDark,
                      ),
                    ),
                    verticalSpaceSmall,
                    verticalSpaceSmall,
                    RepaintBoundary(
                      key: qrKey,
                      child: QrImageView(
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: kcQrColor,
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: kcQrColor),
                        data: 'bnbit_' + business!.id,
                        version: QrVersions.auto,
                        size: 180.0,
                      ),
                    ),
                    verticalSpaceMedium,
                    const ImageBuilder(
                      imagePath: iconImage,
                      height: 40,
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      isOutlined: true,
                      textColor: kcPrimaryColor,
                      backgroundColor: kcPrimaryColor,
                      leadingWidget: const SvgBuilder(
                        svg: downloadSvg,
                      ),
                      title: 'Download',
                      onTap: () => viewModel.onDownLoad(
                        fileName: business!.name,
                        qrKey: qrKey,
                      ),
                    ),
                  ),
                  horizontalSpaceTiny,
                  horizontalSpaceSmall,
                  Expanded(
                    child: AppButton(
                      leadingWidget: const SvgBuilder(
                        svg: shareSvg,
                      ),
                      title: 'Share',
                      onTap: () => viewModel.onShare(
                        fileName: business!.name,
                        qrKey: qrKey,
                      ),
                    ),
                  )
                ],
              ),
              verticalSpaceLarge,
            ],
          ),

          //  MobileScanner(
          //   // fit: BoxFit.contain,
          //   controller: MobileScannerController(
          //     detectionSpeed: DetectionSpeed.normal,
          //     facing: CameraFacing.front,
          //     torchEnabled: true,
          //   ),
          //   onDetect: (capture) {
          //     final List<Barcode> barcodes = capture.barcodes;
          //     final Uint8List? image = capture.image;
          //     for (final barcode in barcodes) {
          //       debugPrint('Barcode found! ${barcode.rawValue}');
          //     }
          //   },
          // ),
        ),
      ),
    );
  }

  @override
  QrViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QrViewModel();
}
