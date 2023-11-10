// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bnbit_app/ui/views/account/account_view.dart' as _i9;
import 'package:bnbit_app/ui/views/create_business/create_business_view.dart'
    as _i8;
import 'package:bnbit_app/ui/views/create_profile/create_profile_view.dart'
    as _i7;
import 'package:bnbit_app/ui/views/home/home_view.dart' as _i2;
import 'package:bnbit_app/ui/views/landing/landing_view.dart' as _i6;
import 'package:bnbit_app/ui/views/login_view/login_view.dart' as _i4;
import 'package:bnbit_app/ui/views/startup/startup_view.dart' as _i3;
import 'package:bnbit_app/ui/views/verify_otp/verify_otp_view.dart' as _i5;
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const verifyOtpView = '/verify-otp-view';

  static const landingView = '/landing-view';

  static const createProfileView = '/create-profile-view';

  static const createBusinessView = '/create-business-view';

  static const accountView = '/account-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    verifyOtpView,
    landingView,
    createProfileView,
    createBusinessView,
    accountView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.verifyOtpView,
      page: _i5.VerifyOtpView,
    ),
    _i1.RouteDef(
      Routes.landingView,
      page: _i6.LandingView,
    ),
    _i1.RouteDef(
      Routes.createProfileView,
      page: _i7.CreateProfileView,
    ),
    _i1.RouteDef(
      Routes.createBusinessView,
      page: _i8.CreateBusinessView,
    ),
    _i1.RouteDef(
      Routes.accountView,
      page: _i9.AccountView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i2.HomeView(key: args.key, businessId: args.businessId),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.LoginView(key: args.key),
        settings: data,
      );
    },
    _i5.VerifyOtpView: (data) {
      final args = data.getArgs<VerifyOtpViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.VerifyOtpView(key: args.key, phoneNumber: args.phoneNumber),
        settings: data,
      );
    },
    _i6.LandingView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LandingView(),
        settings: data,
      );
    },
    _i7.CreateProfileView: (data) {
      final args = data.getArgs<CreateProfileViewArguments>(
        orElse: () => const CreateProfileViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.CreateProfileView(
            key: args.key, firstName: args.firstName, lastName: args.lastName),
        settings: data,
      );
    },
    _i8.CreateBusinessView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.CreateBusinessView(),
        settings: data,
      );
    },
    _i9.AccountView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.AccountView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({
    this.key,
    this.businessId,
  });

  final _i10.Key? key;

  final String? businessId;

  @override
  String toString() {
    return '{"key": "$key", "businessId": "$businessId"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.businessId == businessId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ businessId.hashCode;
  }
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class VerifyOtpViewArguments {
  const VerifyOtpViewArguments({
    this.key,
    required this.phoneNumber,
  });

  final _i10.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return '{"key": "$key", "phoneNumber": "$phoneNumber"}';
  }

  @override
  bool operator ==(covariant VerifyOtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phoneNumber.hashCode;
  }
}

class CreateProfileViewArguments {
  const CreateProfileViewArguments({
    this.key,
    this.firstName,
    this.lastName,
  });

  final _i10.Key? key;

  final String? firstName;

  final String? lastName;

  @override
  String toString() {
    return '{"key": "$key", "firstName": "$firstName", "lastName": "$lastName"}';
  }

  @override
  bool operator ==(covariant CreateProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ firstName.hashCode ^ lastName.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i10.Key? key,
    String? businessId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, businessId: businessId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyOtpView({
    _i10.Key? key,
    required String phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyOtpView,
        arguments: VerifyOtpViewArguments(key: key, phoneNumber: phoneNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateProfileView({
    _i10.Key? key,
    String? firstName,
    String? lastName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createProfileView,
        arguments: CreateProfileViewArguments(
            key: key, firstName: firstName, lastName: lastName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateBusinessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createBusinessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i10.Key? key,
    String? businessId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, businessId: businessId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView({
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyOtpView({
    _i10.Key? key,
    required String phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyOtpView,
        arguments: VerifyOtpViewArguments(key: key, phoneNumber: phoneNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateProfileView({
    _i10.Key? key,
    String? firstName,
    String? lastName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createProfileView,
        arguments: CreateProfileViewArguments(
            key: key, firstName: firstName, lastName: lastName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateBusinessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createBusinessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
