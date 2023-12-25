import 'dart:io';
import 'package:bnbit_app/services/url_launcher_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/data_model/category/category.dart';
import 'package:bnbit_app/data_model/sub_category/sub_category.dart';
import 'package:bnbit_app/data_model/time_range/time_range.dart';
import 'package:bnbit_app/enums/business_option.dart';
import 'package:bnbit_app/extensions/string_extensions.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:bnbit_app/services/media_service.dart';
import 'package:bnbit_app/ui/views/update_create_business/update_create_business_view.form.dart';
import 'package:bnbit_app/ui/views/login_view/login_view.form.dart';
import 'package:bnbit_app/ui/views/my_businesses/my_businesses_view.dart';
import 'package:bnbit_app/utils/time.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _deleteBusinessKey = 'delete business key';

class UpdateCreateBusinessViewModel extends FormViewModel {
  final log = getLogger('CreateBusinessViewModel');
  final _navigationService = locator<NavigationService>();
  final _businessService = locator<BusinessService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MediaService>();
  final _snackService = locator<CustomSnackbarService>();
  final _urlLauncherService = locator<UrlLauncherService>();

  NewBusiness get newBusiness => _businessService.newBusiness;
  Business? get selectedBusiness => _businessService.selectedBusiness;

  List<Address> get selectedAddress => newBusiness.addressDetails;
  List<BusinessServiceModel> get services => newBusiness.services;

  File? _selectedFile;
  File? get selectedFile => _selectedFile;

  final Map<String, String> _communicationFormatChecker = {};
  Map<String, String> get communicationFormatChecker =>
      _communicationFormatChecker;

  bool get hasNoPhoneNumber =>
      showValidationIfAny && phoneNumberValue.isNullOrEmpty;

  bool isEmailValid(String? email) =>
      EmailValidator.validate((email ?? '').trim());

  void setCommunicationFormatChecker({
    required String key,
    required String value,
  }) {
    _communicationFormatChecker[key] = value;
    notifyListeners();
  }

  void checkCommunicationFormat() {
    if (phoneValue.isNullOrEmpty) {
      setCommunicationFormatChecker(
          key: 'phone', value: 'Phone Number can\'nt be empty');
    }
    if (!emailValue.isNullOrEmpty) {
      if (!isEmailValid(emailValue)) {
        setCommunicationFormatChecker(
            key: 'email', value: 'Please enter vaild email address');
      }
    }
    if (!webisteValue.isNullOrEmpty) {
      bool _validURL = webisteValue!.isURL;
      if (!_validURL) {
        setCommunicationFormatChecker(
            key: 'website', value: 'Please enter vaild website link');
      }
    }
    if (!instagramValue.isNullOrEmpty) {
      bool _validURL = instagramValue!.startsWith('https://www.instagram.com/');
      if (!_validURL) {
        setCommunicationFormatChecker(
            key: 'instagram', value: 'Please enter vaild instagram link');
      }
    }
    if (!telegramValue.isNullOrEmpty) {
      bool _validURL = telegramValue!.startsWith('https://www.t.me/');
      if (!_validURL) {
        setCommunicationFormatChecker(
            key: 'telegram', value: 'Please enter vaild telegram link');
      }
    }
    notifyListeners();
  }

  void clearFormatErrorMessage(String key) {
    _communicationFormatChecker[key] = '';
    notifyListeners();
  }

  bool hasCommunicationFormatError(String key) =>
      _showValidationIfAny &&
      _communicationFormatChecker[key] != null &&
      !_communicationFormatChecker[key].isNullOrEmpty;

  bool isLastAdress(address) => selectedAddress.last == address;
  bool isLastSubCategory(subCategory) =>
      _selectedSubCategories.last == subCategory;

  bool isLastService(service) => services.last == service;
  bool get hasBusiness => selectedBusiness != null;
  bool get isDeletingBusiness => busy(_deleteBusinessKey);

  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;

  List<Category> get categories => _businessService.categories;

  List<SubCategory> _selectedSubCategories = [];
  List<SubCategory> get selectedSubCategories => _selectedSubCategories;
  List<SubCategory> get subCategories =>
      _selectedCategory != null ? [..._selectedCategory!.subcategories] : [];

  String _nameValidationMessage = '';
  String get nameValidationMessage => _nameValidationMessage;

  String _descriptionValidationMessage = '';
  String get descriptionValidationMessage => _descriptionValidationMessage;

  bool _showValidationIfAny = false;
  bool get showValidationIfAny => _showValidationIfAny;
  bool get hasValidName => _showValidationIfAny && !nameValue.isNullOrEmpty;
  bool get enableButton =>
      !_showValidationIfAny &&
      !nameValue.isNullOrEmpty &&
      !descriptionValue.isNullOrEmpty &&
      hasCategory &&
      hasAdress;
  bool get hasAdress => selectedAddress.isNotEmpty;
  bool get hasCategory => subCategories.isNotEmpty;

  bool get hasNoValidName {
    if (_showValidationIfAny && nameValue.isNullOrEmpty) {
      _nameValidationMessage = 'Business Name can\'t be empty';
      return true;
    }
    return false;
  }

  bool get hasNoValidDescription {
    if (_showValidationIfAny && descriptionValue.isNullOrEmpty) {
      _descriptionValidationMessage = 'Business Description can\'t be empty';
      return true;
    }
    return false;
  }

  bool isTabSelected(int index) => index == _selectedTabIndex;

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  void onTabChanged(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void onSwapTabChanged(int index) {
    log.e('build');

    if (index != _selectedTabIndex) {
      _selectedTabIndex = index;
      notifyListeners();
    }
  }

  Map<String, TimeRange?> get selectedTradingHours {
    Map<String, TimeRange> operatingHours = {};

    final result = TimeUtil.convertOperatingHoursToTimeRanges(
        {...newBusiness.opening_hours});

    result.forEach((key, value) {
      if (value != null) {
        operatingHours[key] = value;
      }
    });

    return operatingHours;
  }

  bool get hasSelectedTradinghours => selectedTradingHours.isNotEmpty;

  void onInit(Business business) async {
    _selectedCategory = _businessService.categories
        .where((element) => element.id == business.subcategories.first.category)
        .toList()
        .first;
    _selectedSubCategories = business.subcategories;

    webisteValue = business.website;
    phoneNumberValue = phoneNumberValue;
    emailValue = business.email;
    instagramValue = instagramValue;
    telegramValue = telegramValue;
    _businessService.setNewBusiness(newBusiness.copyWith(
      addressDetails: business.addresses,
      opening_hours: business.opening_hours,
      services: business.services,
    ));
  }

  Future<void> onDelete() async {
    final result = await _bottomSheetService.showCustomSheet(
        title: 'Delete this business', variant: BottomSheetType.deleteItem);

    if (result?.confirmed ?? false) {
      try {
        setBusyForObject(_deleteBusinessKey, true);
        await _businessService.deleteBusiness(selectedBusiness!.id);

        _navigationService.clearTillFirstAndShowView(const MyBusinessesView());
        _snackService.showSuccess('Business delete successfully.');
      } catch (e) {
        _snackService.showError('Unable to delete business. Try again!');
        log.e('Unable to delete this business: $e');
      } finally {
        setBusyForObject(_deleteBusinessKey, false);
      }
    }
  }

  Future<void> onCreateBusiness() async {
    _showValidationIfAny = false;
    checkCommunicationFormat();
    if (!enableButton) {
      _showValidationIfAny = true;
      notifyListeners();
      return;
    }

    if (selectedTradingHours.isEmpty) {
      _snackService.showWarning('Please add operating hours');
      notifyListeners();
      return;
    }

    // if (_communicationFormatChecker.values
    //     .any((element) => !element.isNullOrEmpty)) {}
    setBusy(true);

    final businessToBeCreated = newBusiness.copyWith(
      name: nameValue!,
      description: descriptionValue!,
      subcategories: selectedSubCategories.map((e) => {'id': e.id}).toList(),
      phone_number: phoneValue,
      email: emailValue,
      website: webisteValue,
      instagram: instagramValue,
      telegram: telegramValue,
      opening_hours: newBusiness.opening_hours,
      country: 'Ethiopia',
    );

    log.d('businessToBeCreated:$businessToBeCreated');

    try {
      final result = await _businessService.createBusiness(
        businessToBeCreated,
        _selectedFile,
      );
      _navigationService.replaceWithUpdateCreateBusinessView();
      _snackService.showSuccess('Business created successfully.');

      log.v('result:$result');
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
    }
  }

  Future<void> updateBusiness() async {
    _showValidationIfAny = false;
    if (selectedAddress.isEmpty) {
      _snackService.showError('Business Address can\'t be empty!');
      return;
    }
    if (!enableButton) {
      _showValidationIfAny = true;
      notifyListeners();
      return;
    }
    setBusy(true);

    final businessToBeUpated = newBusiness.copyWith(
      name: nameValue!,
      description: descriptionValue!,
      subcategories: selectedSubCategories.map((e) => {'id': e.id}).toList(),
      phone_number: phoneValue,
      email: emailValue,
      website: webisteValue,
      instagram: instagramValue,
      telegram: telegramValue,
      opening_hours: newBusiness.opening_hours,
      country: 'Ethiopia',
    );

    log.d('businessToBeUpated:$businessToBeUpated');

    try {
      final result = await _businessService.updateBusiness(
        business: businessToBeUpated,
        businessId: selectedBusiness!.id,
      );
      _navigationService.clearTillFirstAndShowView(const MyBusinessesView());
      _snackService.showSuccess('Business updated successfully.');

      log.v('result:$result');
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
    }
  }

  Future<void> onAddAddress() async {
    await _navigationService.navigateToBusinessLocationsView();
    notifyListeners();
  }

  void clearNewBusiness() => _businessService.setNewBusiness(fakeBusiness);

  Category? _previousCategory;
  Future<void> onSelectCategory() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.category,
      data: categories,
      description: '',
    );

    if (result?.data == null) return;
    _previousCategory = _selectedCategory;
    _selectedCategory = result!.data;
    notifyListeners();

    await onSelectSubCategory();
  }

  Future<void> onSelectSubCategory({
    bool isAdd = false,
  }) async {
    log.i('subCategories:$subCategories');
    List<SubCategory> selectedSubcategories = [];
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.subCategories,
      data: {
        'selectedItems':
            isAdd ? [..._selectedSubCategories] : selectedSubcategories,
        'items': subCategories,
      },
      description: '',
    );

    if (result?.data == null) {
      if (!isAdd) _selectedCategory = _previousCategory;
      notifyListeners();
      return;
    }

    _selectedSubCategories = result!.data;
    notifyListeners();
  }

  Future<void> onAddImage() async {
    final result = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.uploadImage);

    if (result == null) return;
    log.d('result:${result.data}');
    final tempFile = await _mediaService.pickMedia(
      mediaSourceType: result.data,
      cropImage: true,
    );

    if (tempFile != null) {
      _selectedFile = tempFile;
      notifyListeners();
    }
  }

  void onEditGallery() async {
    _navigationService.navigateTo(Routes.galleryView);
  }

  @override
  void dispose() {
    _businessService.setSelectedBusiness(null);
    super.dispose();
  }

  void onRemove(Address address) {
    String latlng = address.latitude.toString() + address.longitude.toString();
    log.i('latlng:$latlng');
    List<Address> _addresses = [...selectedAddress];
    _addresses.remove(address);
    NewBusiness updatedBusiness =
        newBusiness.copyWith(addressDetails: _addresses);
    _businessService.setNewBusiness(updatedBusiness);
    _businessService.setRemovedAddresses(latlng);
    notifyListeners();
  }

  void onAddressTap(Address address) async {
    onAddAddress();
    return;
  }

  void onQrCodeTap() {
    _navigationService.navigateToQrView(
        business: _businessService.selectedBusiness);
  }

  void onSettingTap() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.businessOption,
      title: selectedBusiness!.name,
    );

    if (result?.data == null) return;

    switch (result!.data) {
      case BusinessOption.qr:
        onQrCodeTap();
        break;
      case BusinessOption.preview:
        onBusinessTap();
        break;
      case BusinessOption.support:
        onSupport();
        break;
      case BusinessOption.delete:
        onDelete();
        break;
      default:
    }
  }

  void onBusinessTap() => _navigationService.navigateToBusinessDetailView(
      business: selectedBusiness!);

  void onOperatingHoursTap() async {
    await _navigationService.navigateToSetScheduleView(
        tradingHours: selectedTradingHours);
    notifyListeners();
  }

  void onServicesTap() async {
    await _navigationService.navigateToServicesView();
    notifyListeners();
  }

  Future<void> onSupport() async {
    await _urlLauncherService.openLink('https://t.me/+4ywvEDq_X9M5Y2Qx');
  }
}
