import 'dart:io';

import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/services/media_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';



mixin MediaMixin on BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MediaService>();

  File? _selectedFile;
  File? get selectedFile => _selectedFile;

  void clearSelectedFile() {
    _selectedFile = null;
    notifyListeners();
  }

  Future<void> onAddImage() async {
    final result = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.uploadImage);

    if (result == null) return;
    final tempFile = await _mediaService.pickMedia(
      mediaSourceType: result.data,
      cropImage: true,
    );

    if (tempFile != null) {
      _selectedFile = tempFile;
      notifyListeners();
    }
  }
}
