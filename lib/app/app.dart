import 'package:bnbit_app/api/category/category_apis.dart';
import 'package:bnbit_app/api/user/user_apis.dart';
import 'package:bnbit_app/services/authentication_service.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:bnbit_app/services/location_service.dart';
import 'package:bnbit_app/services/media_service.dart';
import 'package:bnbit_app/services/permissions_service.dart';
import 'package:bnbit_app/services/shared_preferences_service.dart';
import 'package:bnbit_app/services/url_launcher_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:bnbit_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:bnbit_app/ui/views/home/home_view.dart';
import 'package:bnbit_app/ui/views/landing/landing_viewmodel.dart';
import 'package:bnbit_app/ui/views/select_location/select_location_view.dart';
import 'package:bnbit_app/ui/views/startup/startup_view.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:bnbit_app/ui/views/login_view/login_view.dart';
import 'package:bnbit_app/ui/views/verify_otp/verify_otp_view.dart';
import 'package:bnbit_app/ui/bottom_sheets/country_picker/country_picker_sheet.dart';
import 'package:bnbit_app/ui/views/landing/landing_view.dart';
import 'package:bnbit_app/ui/bottom_sheets/category/category_sheet.dart';
import 'package:bnbit_app/ui/views/create_profile/create_profile_view.dart';
import 'package:bnbit_app/ui/views/create_business/create_business_view.dart';
import 'package:bnbit_app/ui/views/account/account_view.dart';
import 'package:bnbit_app/ui/views/business_locations/business_locations_view.dart';
import 'package:bnbit_app/ui/bottom_sheets/select_location/select_location_sheet.dart';
import 'package:bnbit_app/ui/bottom_sheets/sub_categories/sub_categories_sheet.dart';
import 'package:bnbit_app/ui/bottom_sheets/upload_image/upload_image_sheet.dart';
import 'package:bnbit_app/ui/dialogs/open_setting/open_setting_dialog.dart';
import 'package:bnbit_app/ui/dialogs/location/location_dialog.dart';
import 'package:bnbit_app/ui/views/email_sign_in/email_sign_in_view.dart';
import 'package:bnbit_app/ui/views/forgot_paswword/forgot_paswword_view.dart';
import 'package:bnbit_app/ui/dialogs/forgot_password/forgot_password_dialog.dart';
import 'package:bnbit_app/ui/views/business_detail/business_detail_view.dart';
import 'package:bnbit_app/ui/views/gallery/gallery_view.dart';
import 'package:bnbit_app/ui/bottom_sheets/delete_item/delete_item_sheet.dart';
import 'package:bnbit_app/ui/views/my_businesses/my_businesses_view.dart';
import 'package:bnbit_app/ui/views/business_setting/business_setting_view.dart';
import 'package:bnbit_app/ui/views/search_view/search_view_view.dart';
import 'package:bnbit_app/ui/views/notification/notification_view.dart';
import 'package:bnbit_app/ui/views/edit_profile/edit_profile_view.dart';
import 'package:bnbit_app/ui/bottom_sheets/image_option/image_option_sheet.dart';
import 'package:bnbit_app/ui/bottom_sheets/address_option/address_option_sheet.dart';
import 'package:bnbit_app/ui/views/qr/qr_view.dart';
import 'package:bnbit_app/ui/views/scanner/scanner_view.dart';
import 'package:bnbit_app/ui/views/change_password/change_password_view.dart';
import 'package:bnbit_app/ui/views/change_success/change_success_view.dart';
import 'package:bnbit_app/ui/bottom_sheets/business_option/business_option_sheet.dart';
import 'package:bnbit_app/ui/views/set_trading_hours/set_trading_hours_view.dart';
import 'package:bnbit_app/ui/bottom_sheets/time_selection/time_selection_sheet.dart';
import 'package:bnbit_app/ui/bottom_sheets/address_detail/address_detail_sheet.dart';
import 'package:bnbit_app/ui/views/show_full_image/show_full_image_view.dart';
import 'package:bnbit_app/ui/dialogs/warning/warning_dialog.dart';
import 'package:bnbit_app/ui/views/dashboard/dashboard_view.dart';
import 'package:bnbit_app/ui/views/address_search/address_searches_view.dart';
import 'package:bnbit_app/ui/views/recent_searches/recent_searches_view.dart';
import 'package:bnbit_app/ui/views/services/services_view.dart';
import 'package:bnbit_app/ui/bottom_sheets/input_field/input_field_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    //MaterialRoute(page: LoginView),
    MaterialRoute(page: VerifyOtpView),
    MaterialRoute(page: LandingView),
    MaterialRoute(page: CreateProfileView),
    MaterialRoute(page: CreateBusinessView),
    MaterialRoute(page: AccountView),
    MaterialRoute(page: BusinessLocationsView),
    MaterialRoute(page: ForgotPasswordView),
    CustomRoute(
      page: LoginView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: EmailSignInView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    MaterialRoute(page: BusinessDetailView),
    MaterialRoute(page: GalleryView),
    MaterialRoute(page: MyBusinessesView),
    MaterialRoute(page: BusinessSettingView),
    MaterialRoute(page: SearchViewView),
    MaterialRoute(page: NotificationView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: QrView),
    MaterialRoute(page: ScannerView),
    MaterialRoute(page: ChangePasswordView),
    MaterialRoute(page: ChangeSuccessView),
    MaterialRoute(page: SetScheduleView),
    MaterialRoute(page: SelectLocationView),
    MaterialRoute(page: ShowFullImageView),

    MaterialRoute(page: DashboardView),
    MaterialRoute(page: AddressSearchesView),
MaterialRoute(page: RecentSearchesView),
MaterialRoute(page: ServicesView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: BusinessService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: CustomSnackbarService),
    LazySingleton(classType: PlacesService),
    LazySingleton(classType: MediaService),
    LazySingleton(classType: PermissionsService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: LandingViewModel),
    LazySingleton(classType: UrlLauncherService),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),

    /// APIs
    LazySingleton(classType: CategoryApis),
    LazySingleton(classType: UserApis),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CountryPickerSheet),
    StackedBottomsheet(classType: CategorySheet),
    StackedBottomsheet(classType: SelectLocationSheet),
    StackedBottomsheet(classType: SubCategoriesSheet),
    StackedBottomsheet(classType: UploadImageSheet),
    StackedBottomsheet(classType: DeleteItemSheet),
    StackedBottomsheet(classType: ImageOptionSheet),
    StackedBottomsheet(classType: AddressOptionSheet),
    StackedBottomsheet(classType: BusinessOptionSheet),
    StackedBottomsheet(classType: TimeSelectionSheet),
    StackedBottomsheet(classType: AddressDetailSheet),
StackedBottomsheet(classType: InputFieldSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: OpenSettingDialog),
    StackedDialog(classType: LocationDialog),

    StackedDialog(classType: ForgotPasswordDialog),
    StackedDialog(classType: WarningDialog),
// @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
