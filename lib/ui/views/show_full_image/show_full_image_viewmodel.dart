import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:stacked/stacked.dart';

class ShowFullImageViewModel extends BaseViewModel {
  final log = getLogger('ShowFullImageViewModel');
  final _snackBarService = locator<CustomSnackbarService>();

  Future<void> onDownloadImage(String imagePath) async {
    setBusy(true);
    try {
      await GallerySaver.saveImage(imagePath);
      _snackBarService.showImageSaved('Image saved to gallery');
    } catch (e) {
      log.e('Unable to download image $e');
      _snackBarService.showError('try_again');
    } finally {
      setBusy(false);
    }
  }
}
