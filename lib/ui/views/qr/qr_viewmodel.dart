import 'dart:io';

import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'dart:ui' as ui_1;

class QrViewModel extends BaseViewModel {
  final log = getLogger('QrViewModel');
  final _snackBarService = locator<CustomSnackbarService>();
  void onDownLoad({
    required String fileName,
    required GlobalKey qrKey,
  }) async {
    final file = await capturePng(fileName: fileName, qrKey: qrKey);

    try {
      await GallerySaver.saveImage(file.path);
      _snackBarService.showImageSaved('Image saved to gallery');
    } catch (e) {
      log.e('Unable to download image $e');
      _snackBarService.showError('try_again');
    } finally {
      setBusy(false);
    }
  }

  void onShare({
    required String fileName,
    required GlobalKey qrKey,
  }) async {
    final file = await capturePng(fileName: fileName, qrKey: qrKey);

    await Share.shareXFiles([
      XFile(file.path),
    ], subject: fileName);
  }

  Future<File> capturePng({
    required String fileName,
    required GlobalKey qrKey,
  }) async {
    try {
      RenderRepaintBoundary? boundary =
          qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      final image = await boundary!.toImage(pixelRatio: 3);

      ByteData? byteData =
          await image.toByteData(format: ui_1.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      Directory directory = await getApplicationDocumentsDirectory();

      Directory newDirecory = Directory('${directory.path}/BnBit');

      if (!newDirecory.existsSync()) newDirecory.createSync();

      File file = await File('${newDirecory.path}/$fileName.png').create();
      return await file.writeAsBytes(pngBytes);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
