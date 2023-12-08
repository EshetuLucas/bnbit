import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/enums/business_image_option.dart';
import 'package:bnbit_app/mixins/media_mixin.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
//import 'package:stacked_services/stacked_services.dart';

const String imageBusyKey = 'imageBusy';

class GalleryViewModel extends BaseViewModel with MediaMixin {
  final log = getLogger('GalleryViewModel');
  final _navigationService = locator<NavigationService>();
  final _businessService = locator<BusinessService>();
  final _snackBarService = locator<CustomSnackbarService>();
  final _bottomSheetService = locator<BottomSheetService>();

  NewBusiness get newBusiness => _businessService.newBusiness;

  Business? get selectedBusiness => _businessService.selectedBusiness;

  String _selectedImageId = '';
  bool isImageBusy(String id) => busy(imageBusyKey) && _selectedImageId == id;

  Future<void> uploadImage() async {
    await onAddImage();
    if (selectedFile == null) return;
    setBusy(true);
    try {
      await _businessService.uploadImage(
          business: selectedBusiness!.id, image: selectedFile!);
      notifyListeners();

      clearSelectedFile();
    } catch (e) {
      _snackBarService.showError('Something went wrong! Try again');
      _snackBarService.showError('Something went wrong!');
      log.e('Unable to upload image : $e');
    } finally {
      setBusy(false);
    }
  }

  void onImageTap(Image image) async {
    _selectedImageId = image.id;
    final result = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.imageOption);

    if (result != null) {
      try {
        setBusyForObject(imageBusyKey, true);
        Business selectedBusiness = _businessService.selectedBusiness!;
        final businessToBeUpated = newBusiness.copyWith(
          name: selectedBusiness.name,
          description: selectedBusiness.description,
          subcategories:
              selectedBusiness.subcategories.map((e) => {'id': e.id}).toList(),
          phone_number: selectedBusiness.phone,
          email: selectedBusiness.email,
          website: selectedBusiness.website,
          instagram: selectedBusiness.instagram,
          telegram: selectedBusiness.telegram,
          opening_hours: selectedBusiness.opening_hours,
          cover_image: baseUrl + '/' + image.image,
          country: 'Ethiopia',
          services: [],
        );

        if (result.data == BusinessImageOption.coverImage) {
          await _businessService.updateBusiness(
              business: businessToBeUpated, businessId: selectedBusiness.id);

          _snackBarService.showSuccess('Business cover image changed');
          // Make it cover
        } else if (result.data == BusinessImageOption.view) {
          _navigationService.navigateToShowFullImageView(
              imagePath: baseUrl + '/' + image.image, isFromFile: false);
        } else {
          if (selectedBusiness.images.length == 1) {
            _snackBarService
                .showWarning('Business should have at least one image.');

            return;
          }
          // Delete image
          if (image.image == selectedBusiness.logo) {
            await _businessService.updateBusiness(
                business: businessToBeUpated.copyWith(logo: null),
                businessId: selectedBusiness.id);
          }
          await _businessService.deleteImage(image.id);
          _snackBarService.showSuccess('Image deleted');
        }
      } catch (e) {
        log.e('Something went wrong:$e');
        _snackBarService.showError('Something went wrong! Try again');
      } finally {
        setBusyForObject(imageBusyKey, false);
        notifyListeners();
      }
    }
  }
}
