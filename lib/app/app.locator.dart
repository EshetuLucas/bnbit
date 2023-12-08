// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:places_service/src/places_service.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../api/category/category_apis.dart';
import '../api/user/user_apis.dart';
import '../services/authentication_service.dart';
import '../services/business_service.dart';
import '../services/custom_snackbar_service.dart';
import '../services/location_service.dart';
import '../services/media_service.dart';
import '../services/permissions_service.dart';
import '../services/url_launcher_service.dart';
import '../services/user_service.dart';
import '../ui/views/landing/landing_viewmodel.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => BusinessService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => FirebaseAuthenticationService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => CustomSnackbarService());
  locator.registerLazySingleton(() => PlacesService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => PermissionsService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => LandingViewModel());
  locator.registerLazySingleton(() => UrlLauncherService());
  locator.registerLazySingleton(() => CategoryApis());
  locator.registerLazySingleton(() => UserApis());
}
