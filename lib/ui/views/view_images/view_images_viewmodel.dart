import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:stacked/stacked.dart';

class ViewImagesViewModel extends BaseViewModel {
  final log = getLogger('ShowFullImageViewModel');
  final _snackBarService = locator<CustomSnackbarService>();

  final List<String> images;
  ViewImagesViewModel(this.images, this._currentImageUrl);

  int _currentImageUrl = 0;
  int get currentImageUrl => _currentImageUrl;
  bool isCurrentImage(int index) => _currentImageUrl == index;

  String get appBartitle {
    String title = ' of ${images.length}';
    int index = _currentImageUrl + 1;

    return '$index' + title;
  }

  void onChangeImage(int index) {
    _currentImageUrl = index;
    notifyListeners();
  }

  Future<void> onDownloadImage() async {
    setBusy(true);
    try {
      await GallerySaver.saveImage(baseUrl + '/' + images[_currentImageUrl]);
      _snackBarService.showImageSaved('Image saved to gallery');
    } catch (e) {
      log.e('Unable to download image $e');
      _snackBarService.showError('try_again');
    } finally {
      setBusy(false);
    }
  }
}
