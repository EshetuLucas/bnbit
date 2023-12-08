import 'dart:io';

import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/theme_class.dart';
import 'package:bnbit_app/ui/views/change_password/change_password_view.dart';
import 'package:bnbit_app/ui/views/startup/startup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/app/app.bottomsheets.dart';
import 'package:bnbit_app/app/app.dialogs.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await dotenv.load();
  //setupSnackbarUi();
  // To turn off landscape mode
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(const MyApp());
}

class MyApp extends StackedView<MainViewModel> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeClass.lightTheme,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: viewModel.systemUiOverlayStyle,
        child: const StartupView(),
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();
}

class MainViewModel extends BaseViewModel {
  SystemUiOverlayStyle get systemUiOverlayStyle =>
      Platform.isAndroid ? androidOverlayStyle : iosOverlayStyle;

  static const iosOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: kcWhite,
    systemNavigationBarColor: kcWhite,
    systemNavigationBarDividerColor: kcWhite,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    systemStatusBarContrastEnforced: true,
    statusBarIconBrightness: Brightness.light,
  );

  static const androidOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: kcWhite,
    systemNavigationBarColor: kcWhite,
    systemNavigationBarDividerColor: kcWhite,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: true,
    statusBarIconBrightness: Brightness.dark,
  );
}
