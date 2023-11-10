import 'package:bnbit_app/api/category/category_apis.dart';
import 'package:bnbit_app/api/user/user_apis.dart';
import 'package:bnbit_app/services/authentication_service.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/services/custom_snackbar_service.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:bnbit_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:bnbit_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:bnbit_app/ui/views/home/home_view.dart';
import 'package:bnbit_app/ui/views/startup/startup_view.dart';
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
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: VerifyOtpView),
    MaterialRoute(page: LandingView),
MaterialRoute(page: CreateProfileView),
MaterialRoute(page: CreateBusinessView),
MaterialRoute(page: AccountView),
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

    /// APIs
    LazySingleton(classType: CategoryApis),
    LazySingleton(classType: UserApis),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CountryPickerSheet),
    StackedBottomsheet(classType: CategorySheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
