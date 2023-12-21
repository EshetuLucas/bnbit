// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bnbit_app/data_model/business/business_model.dart' as _i32;
import 'package:bnbit_app/data_model/time_range/time_range.dart' as _i33;
import 'package:bnbit_app/ui/views/account/account_view.dart' as _i8;
import 'package:bnbit_app/ui/views/address_search/address_searches_view.dart'
    as _i28;
import 'package:bnbit_app/ui/views/business_detail/business_detail_view.dart'
    as _i13;
import 'package:bnbit_app/ui/views/business_locations/business_locations_view.dart'
    as _i9;
import 'package:bnbit_app/ui/views/business_setting/business_setting_view.dart'
    as _i16;
import 'package:bnbit_app/ui/views/change_password/change_password_view.dart'
    as _i22;
import 'package:bnbit_app/ui/views/change_success/change_success_view.dart'
    as _i23;
import 'package:bnbit_app/ui/views/create_business/create_business_view.dart'
    as _i7;
import 'package:bnbit_app/ui/views/create_profile/create_profile_view.dart'
    as _i6;
import 'package:bnbit_app/ui/views/dashboard/dashboard_view.dart' as _i27;
import 'package:bnbit_app/ui/views/edit_profile/edit_profile_view.dart' as _i19;
import 'package:bnbit_app/ui/views/email_sign_in/email_sign_in_view.dart'
    as _i12;
import 'package:bnbit_app/ui/views/forgot_paswword/forgot_paswword_view.dart'
    as _i10;
import 'package:bnbit_app/ui/views/gallery/gallery_view.dart' as _i14;
import 'package:bnbit_app/ui/views/home/home_view.dart' as _i2;
import 'package:bnbit_app/ui/views/landing/landing_view.dart' as _i5;
import 'package:bnbit_app/ui/views/login_view/login_view.dart' as _i11;
import 'package:bnbit_app/ui/views/my_businesses/my_businesses_view.dart'
    as _i15;
import 'package:bnbit_app/ui/views/notification/notification_view.dart' as _i18;
import 'package:bnbit_app/ui/views/qr/qr_view.dart' as _i20;
import 'package:bnbit_app/ui/views/recent_searches/recent_searches_view.dart'
    as _i29;
import 'package:bnbit_app/ui/views/scanner/scanner_view.dart' as _i21;
import 'package:bnbit_app/ui/views/search_view/search_view_view.dart' as _i17;
import 'package:bnbit_app/ui/views/select_location/select_location_view.dart'
    as _i25;
import 'package:bnbit_app/ui/views/services/services_view.dart' as _i30;
import 'package:bnbit_app/ui/views/set_trading_hours/set_trading_hours_view.dart'
    as _i24;
import 'package:bnbit_app/ui/views/show_full_image/show_full_image_view.dart'
    as _i26;
import 'package:bnbit_app/ui/views/startup/startup_view.dart' as _i3;
import 'package:bnbit_app/ui/views/verify_otp/verify_otp_view.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i31;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i34;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const verifyOtpView = '/verify-otp-view';

  static const landingView = '/landing-view';

  static const createProfileView = '/create-profile-view';

  static const createBusinessView = '/create-business-view';

  static const accountView = '/account-view';

  static const businessLocationsView = '/business-locations-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const loginView = '/login-view';

  static const emailSignInView = '/email-sign-in-view';

  static const businessDetailView = '/business-detail-view';

  static const galleryView = '/gallery-view';

  static const myBusinessesView = '/my-businesses-view';

  static const businessSettingView = '/business-setting-view';

  static const searchViewView = '/search-view-view';

  static const notificationView = '/notification-view';

  static const editProfileView = '/edit-profile-view';

  static const qrView = '/qr-view';

  static const scannerView = '/scanner-view';

  static const changePasswordView = '/change-password-view';

  static const changeSuccessView = '/change-success-view';

  static const setScheduleView = '/set-schedule-view';

  static const selectLocationView = '/select-location-view';

  static const showFullImageView = '/show-full-image-view';

  static const dashboardView = '/dashboard-view';

  static const addressSearchesView = '/address-searches-view';

  static const recentSearchesView = '/recent-searches-view';

  static const servicesView = '/services-view';

  static const all = <String>{
    homeView,
    startupView,
    verifyOtpView,
    landingView,
    createProfileView,
    createBusinessView,
    accountView,
    businessLocationsView,
    forgotPasswordView,
    loginView,
    emailSignInView,
    businessDetailView,
    galleryView,
    myBusinessesView,
    businessSettingView,
    searchViewView,
    notificationView,
    editProfileView,
    qrView,
    scannerView,
    changePasswordView,
    changeSuccessView,
    setScheduleView,
    selectLocationView,
    showFullImageView,
    dashboardView,
    addressSearchesView,
    recentSearchesView,
    servicesView,
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
      Routes.verifyOtpView,
      page: _i4.VerifyOtpView,
    ),
    _i1.RouteDef(
      Routes.landingView,
      page: _i5.LandingView,
    ),
    _i1.RouteDef(
      Routes.createProfileView,
      page: _i6.CreateProfileView,
    ),
    _i1.RouteDef(
      Routes.createBusinessView,
      page: _i7.CreateBusinessView,
    ),
    _i1.RouteDef(
      Routes.accountView,
      page: _i8.AccountView,
    ),
    _i1.RouteDef(
      Routes.businessLocationsView,
      page: _i9.BusinessLocationsView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i10.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i11.LoginView,
    ),
    _i1.RouteDef(
      Routes.emailSignInView,
      page: _i12.EmailSignInView,
    ),
    _i1.RouteDef(
      Routes.businessDetailView,
      page: _i13.BusinessDetailView,
    ),
    _i1.RouteDef(
      Routes.galleryView,
      page: _i14.GalleryView,
    ),
    _i1.RouteDef(
      Routes.myBusinessesView,
      page: _i15.MyBusinessesView,
    ),
    _i1.RouteDef(
      Routes.businessSettingView,
      page: _i16.BusinessSettingView,
    ),
    _i1.RouteDef(
      Routes.searchViewView,
      page: _i17.SearchViewView,
    ),
    _i1.RouteDef(
      Routes.notificationView,
      page: _i18.NotificationView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i19.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.qrView,
      page: _i20.QrView,
    ),
    _i1.RouteDef(
      Routes.scannerView,
      page: _i21.ScannerView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i22.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.changeSuccessView,
      page: _i23.ChangeSuccessView,
    ),
    _i1.RouteDef(
      Routes.setScheduleView,
      page: _i24.SetScheduleView,
    ),
    _i1.RouteDef(
      Routes.selectLocationView,
      page: _i25.SelectLocationView,
    ),
    _i1.RouteDef(
      Routes.showFullImageView,
      page: _i26.ShowFullImageView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i27.DashboardView,
    ),
    _i1.RouteDef(
      Routes.addressSearchesView,
      page: _i28.AddressSearchesView,
    ),
    _i1.RouteDef(
      Routes.recentSearchesView,
      page: _i29.RecentSearchesView,
    ),
    _i1.RouteDef(
      Routes.servicesView,
      page: _i30.ServicesView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i2.HomeView(key: args.key, businessId: args.businessId),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.VerifyOtpView: (data) {
      final args = data.getArgs<VerifyOtpViewArguments>(nullOk: false);
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.VerifyOtpView(
            key: args.key,
            phoneNumber: args.phoneNumber,
            password: args.password),
        settings: data,
      );
    },
    _i5.LandingView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LandingView(),
        settings: data,
      );
    },
    _i6.CreateProfileView: (data) {
      final args = data.getArgs<CreateProfileViewArguments>(
        orElse: () => const CreateProfileViewArguments(),
      );
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.CreateProfileView(
            key: args.key,
            firstName: args.firstName,
            lastName: args.lastName,
            phoneNumber: args.phoneNumber),
        settings: data,
      );
    },
    _i7.CreateBusinessView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.CreateBusinessView(),
        settings: data,
      );
    },
    _i8.AccountView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.AccountView(),
        settings: data,
      );
    },
    _i9.BusinessLocationsView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.BusinessLocationsView(),
        settings: data,
      );
    },
    _i10.ForgotPasswordView: (data) {
      final args = data.getArgs<ForgotPasswordViewArguments>(
        orElse: () => const ForgotPasswordViewArguments(),
      );
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ForgotPasswordView(key: args.key),
        settings: data,
      );
    },
    _i11.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i31.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i11.LoginView(key: args.key),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i12.EmailSignInView: (data) {
      final args = data.getArgs<EmailSignInViewArguments>(
        orElse: () => const EmailSignInViewArguments(),
      );
      return _i31.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i12.EmailSignInView(key: args.key),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i13.BusinessDetailView: (data) {
      final args = data.getArgs<BusinessDetailViewArguments>(nullOk: false);
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.BusinessDetailView(key: args.key, business: args.business),
        settings: data,
      );
    },
    _i14.GalleryView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.GalleryView(),
        settings: data,
      );
    },
    _i15.MyBusinessesView: (data) {
      final args = data.getArgs<MyBusinessesViewArguments>(
        orElse: () => const MyBusinessesViewArguments(),
      );
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.MyBusinessesView(
            key: args.key, isSavedBusiness: args.isSavedBusiness),
        settings: data,
      );
    },
    _i16.BusinessSettingView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.BusinessSettingView(),
        settings: data,
      );
    },
    _i17.SearchViewView: (data) {
      final args = data.getArgs<SearchViewViewArguments>(
        orElse: () => const SearchViewViewArguments(),
      );
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.SearchViewView(
            key: args.key, homeViewCallBack: args.homeViewCallBack),
        settings: data,
      );
    },
    _i18.NotificationView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.NotificationView(),
        settings: data,
      );
    },
    _i19.EditProfileView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.EditProfileView(),
        settings: data,
      );
    },
    _i20.QrView: (data) {
      final args = data.getArgs<QrViewArguments>(
        orElse: () => const QrViewArguments(),
      );
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i20.QrView(key: args.key, business: args.business),
        settings: data,
      );
    },
    _i21.ScannerView: (data) {
      final args = data.getArgs<ScannerViewArguments>(
        orElse: () => const ScannerViewArguments(),
      );
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.ScannerView(key: args.key),
        settings: data,
      );
    },
    _i22.ChangePasswordView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.ChangePasswordView(),
        settings: data,
      );
    },
    _i23.ChangeSuccessView: (data) {
      final args = data.getArgs<ChangeSuccessViewArguments>(nullOk: false);
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.ChangeSuccessView(
            key: args.key,
            image: args.image,
            title: args.title,
            subtitle: args.subtitle),
        settings: data,
      );
    },
    _i24.SetScheduleView: (data) {
      final args = data.getArgs<SetScheduleViewArguments>(
        orElse: () => const SetScheduleViewArguments(),
      );
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i24.SetScheduleView(
            key: args.key, tradingHours: args.tradingHours),
        settings: data,
      );
    },
    _i25.SelectLocationView: (data) {
      final args = data.getArgs<SelectLocationViewArguments>(nullOk: false);
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i25.SelectLocationView(key: args.key, businesses: args.businesses),
        settings: data,
      );
    },
    _i26.ShowFullImageView: (data) {
      final args = data.getArgs<ShowFullImageViewArguments>(nullOk: false);
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i26.ShowFullImageView(
            key: args.key,
            imagePath: args.imagePath,
            isFromFile: args.isFromFile),
        settings: data,
      );
    },
    _i27.DashboardView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.DashboardView(),
        settings: data,
      );
    },
    _i28.AddressSearchesView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.AddressSearchesView(),
        settings: data,
      );
    },
    _i29.RecentSearchesView: (data) {
      final args = data.getArgs<RecentSearchesViewArguments>(nullOk: false);
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => _i29.RecentSearchesView(
            key: args.key,
            recentSearches: args.recentSearches,
            nameKey: args.nameKey,
            title: args.title),
        settings: data,
      );
    },
    _i30.ServicesView: (data) {
      return _i31.MaterialPageRoute<dynamic>(
        builder: (context) => const _i30.ServicesView(),
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

  final _i31.Key? key;

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

class VerifyOtpViewArguments {
  const VerifyOtpViewArguments({
    this.key,
    required this.phoneNumber,
    this.password,
  });

  final _i31.Key? key;

  final String phoneNumber;

  final String? password;

  @override
  String toString() {
    return '{"key": "$key", "phoneNumber": "$phoneNumber", "password": "$password"}';
  }

  @override
  bool operator ==(covariant VerifyOtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.phoneNumber == phoneNumber &&
        other.password == password;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phoneNumber.hashCode ^ password.hashCode;
  }
}

class CreateProfileViewArguments {
  const CreateProfileViewArguments({
    this.key,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  final _i31.Key? key;

  final String? firstName;

  final String? lastName;

  final String? phoneNumber;

  @override
  String toString() {
    return '{"key": "$key", "firstName": "$firstName", "lastName": "$lastName", "phoneNumber": "$phoneNumber"}';
  }

  @override
  bool operator ==(covariant CreateProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode;
  }
}

class ForgotPasswordViewArguments {
  const ForgotPasswordViewArguments({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ForgotPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i31.Key? key;

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

class EmailSignInViewArguments {
  const EmailSignInViewArguments({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant EmailSignInViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class BusinessDetailViewArguments {
  const BusinessDetailViewArguments({
    this.key,
    required this.business,
  });

  final _i31.Key? key;

  final _i32.Business business;

  @override
  String toString() {
    return '{"key": "$key", "business": "$business"}';
  }

  @override
  bool operator ==(covariant BusinessDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.business == business;
  }

  @override
  int get hashCode {
    return key.hashCode ^ business.hashCode;
  }
}

class MyBusinessesViewArguments {
  const MyBusinessesViewArguments({
    this.key,
    this.isSavedBusiness = false,
  });

  final _i31.Key? key;

  final bool isSavedBusiness;

  @override
  String toString() {
    return '{"key": "$key", "isSavedBusiness": "$isSavedBusiness"}';
  }

  @override
  bool operator ==(covariant MyBusinessesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isSavedBusiness == isSavedBusiness;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isSavedBusiness.hashCode;
  }
}

class SearchViewViewArguments {
  const SearchViewViewArguments({
    this.key,
    this.homeViewCallBack,
  });

  final _i31.Key? key;

  final void Function(int)? homeViewCallBack;

  @override
  String toString() {
    return '{"key": "$key", "homeViewCallBack": "$homeViewCallBack"}';
  }

  @override
  bool operator ==(covariant SearchViewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.homeViewCallBack == homeViewCallBack;
  }

  @override
  int get hashCode {
    return key.hashCode ^ homeViewCallBack.hashCode;
  }
}

class QrViewArguments {
  const QrViewArguments({
    this.key,
    this.business,
  });

  final _i31.Key? key;

  final _i32.Business? business;

  @override
  String toString() {
    return '{"key": "$key", "business": "$business"}';
  }

  @override
  bool operator ==(covariant QrViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.business == business;
  }

  @override
  int get hashCode {
    return key.hashCode ^ business.hashCode;
  }
}

class ScannerViewArguments {
  const ScannerViewArguments({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ScannerViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ChangeSuccessViewArguments {
  const ChangeSuccessViewArguments({
    this.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final _i31.Key? key;

  final String image;

  final String title;

  final String subtitle;

  @override
  String toString() {
    return '{"key": "$key", "image": "$image", "title": "$title", "subtitle": "$subtitle"}';
  }

  @override
  bool operator ==(covariant ChangeSuccessViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.image == image &&
        other.title == title &&
        other.subtitle == subtitle;
  }

  @override
  int get hashCode {
    return key.hashCode ^ image.hashCode ^ title.hashCode ^ subtitle.hashCode;
  }
}

class SetScheduleViewArguments {
  const SetScheduleViewArguments({
    this.key,
    this.tradingHours,
  });

  final _i31.Key? key;

  final Map<String, _i33.TimeRange?>? tradingHours;

  @override
  String toString() {
    return '{"key": "$key", "tradingHours": "$tradingHours"}';
  }

  @override
  bool operator ==(covariant SetScheduleViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.tradingHours == tradingHours;
  }

  @override
  int get hashCode {
    return key.hashCode ^ tradingHours.hashCode;
  }
}

class SelectLocationViewArguments {
  const SelectLocationViewArguments({
    this.key,
    required this.businesses,
  });

  final _i31.Key? key;

  final List<_i32.Business> businesses;

  @override
  String toString() {
    return '{"key": "$key", "businesses": "$businesses"}';
  }

  @override
  bool operator ==(covariant SelectLocationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.businesses == businesses;
  }

  @override
  int get hashCode {
    return key.hashCode ^ businesses.hashCode;
  }
}

class ShowFullImageViewArguments {
  const ShowFullImageViewArguments({
    this.key,
    required this.imagePath,
    this.isFromFile = true,
  });

  final _i31.Key? key;

  final String imagePath;

  final bool isFromFile;

  @override
  String toString() {
    return '{"key": "$key", "imagePath": "$imagePath", "isFromFile": "$isFromFile"}';
  }

  @override
  bool operator ==(covariant ShowFullImageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.imagePath == imagePath &&
        other.isFromFile == isFromFile;
  }

  @override
  int get hashCode {
    return key.hashCode ^ imagePath.hashCode ^ isFromFile.hashCode;
  }
}

class RecentSearchesViewArguments {
  const RecentSearchesViewArguments({
    this.key,
    required this.recentSearches,
    required this.nameKey,
    required this.title,
  });

  final _i31.Key? key;

  final List<String> recentSearches;

  final String nameKey;

  final String title;

  @override
  String toString() {
    return '{"key": "$key", "recentSearches": "$recentSearches", "nameKey": "$nameKey", "title": "$title"}';
  }

  @override
  bool operator ==(covariant RecentSearchesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.recentSearches == recentSearches &&
        other.nameKey == nameKey &&
        other.title == title;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        recentSearches.hashCode ^
        nameKey.hashCode ^
        title.hashCode;
  }
}

extension NavigatorStateExtension on _i34.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i31.Key? key,
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

  Future<dynamic> navigateToVerifyOtpView({
    _i31.Key? key,
    required String phoneNumber,
    String? password,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyOtpView,
        arguments: VerifyOtpViewArguments(
            key: key, phoneNumber: phoneNumber, password: password),
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
    _i31.Key? key,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createProfileView,
        arguments: CreateProfileViewArguments(
            key: key,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber),
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

  Future<dynamic> navigateToBusinessLocationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.businessLocationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView({
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i31.Key? key,
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

  Future<dynamic> navigateToEmailSignInView({
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.emailSignInView,
        arguments: EmailSignInViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBusinessDetailView({
    _i31.Key? key,
    required _i32.Business business,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.businessDetailView,
        arguments: BusinessDetailViewArguments(key: key, business: business),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGalleryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.galleryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyBusinessesView({
    _i31.Key? key,
    bool isSavedBusiness = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.myBusinessesView,
        arguments: MyBusinessesViewArguments(
            key: key, isSavedBusiness: isSavedBusiness),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBusinessSettingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.businessSettingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchViewView({
    _i31.Key? key,
    void Function(int)? homeViewCallBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.searchViewView,
        arguments: SearchViewViewArguments(
            key: key, homeViewCallBack: homeViewCallBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQrView({
    _i31.Key? key,
    _i32.Business? business,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.qrView,
        arguments: QrViewArguments(key: key, business: business),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScannerView({
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.scannerView,
        arguments: ScannerViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangeSuccessView({
    _i31.Key? key,
    required String image,
    required String title,
    required String subtitle,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.changeSuccessView,
        arguments: ChangeSuccessViewArguments(
            key: key, image: image, title: title, subtitle: subtitle),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetScheduleView({
    _i31.Key? key,
    Map<String, _i33.TimeRange?>? tradingHours,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.setScheduleView,
        arguments:
            SetScheduleViewArguments(key: key, tradingHours: tradingHours),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSelectLocationView({
    _i31.Key? key,
    required List<_i32.Business> businesses,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.selectLocationView,
        arguments:
            SelectLocationViewArguments(key: key, businesses: businesses),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShowFullImageView({
    _i31.Key? key,
    required String imagePath,
    bool isFromFile = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.showFullImageView,
        arguments: ShowFullImageViewArguments(
            key: key, imagePath: imagePath, isFromFile: isFromFile),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddressSearchesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addressSearchesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecentSearchesView({
    _i31.Key? key,
    required List<String> recentSearches,
    required String nameKey,
    required String title,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.recentSearchesView,
        arguments: RecentSearchesViewArguments(
            key: key,
            recentSearches: recentSearches,
            nameKey: nameKey,
            title: title),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToServicesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.servicesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i31.Key? key,
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

  Future<dynamic> replaceWithVerifyOtpView({
    _i31.Key? key,
    required String phoneNumber,
    String? password,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyOtpView,
        arguments: VerifyOtpViewArguments(
            key: key, phoneNumber: phoneNumber, password: password),
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
    _i31.Key? key,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createProfileView,
        arguments: CreateProfileViewArguments(
            key: key,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber),
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

  Future<dynamic> replaceWithBusinessLocationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.businessLocationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView({
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView({
    _i31.Key? key,
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

  Future<dynamic> replaceWithEmailSignInView({
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.emailSignInView,
        arguments: EmailSignInViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBusinessDetailView({
    _i31.Key? key,
    required _i32.Business business,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.businessDetailView,
        arguments: BusinessDetailViewArguments(key: key, business: business),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGalleryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.galleryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyBusinessesView({
    _i31.Key? key,
    bool isSavedBusiness = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.myBusinessesView,
        arguments: MyBusinessesViewArguments(
            key: key, isSavedBusiness: isSavedBusiness),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBusinessSettingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.businessSettingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchViewView({
    _i31.Key? key,
    void Function(int)? homeViewCallBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.searchViewView,
        arguments: SearchViewViewArguments(
            key: key, homeViewCallBack: homeViewCallBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQrView({
    _i31.Key? key,
    _i32.Business? business,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.qrView,
        arguments: QrViewArguments(key: key, business: business),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScannerView({
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.scannerView,
        arguments: ScannerViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangeSuccessView({
    _i31.Key? key,
    required String image,
    required String title,
    required String subtitle,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.changeSuccessView,
        arguments: ChangeSuccessViewArguments(
            key: key, image: image, title: title, subtitle: subtitle),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSetScheduleView({
    _i31.Key? key,
    Map<String, _i33.TimeRange?>? tradingHours,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.setScheduleView,
        arguments:
            SetScheduleViewArguments(key: key, tradingHours: tradingHours),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSelectLocationView({
    _i31.Key? key,
    required List<_i32.Business> businesses,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.selectLocationView,
        arguments:
            SelectLocationViewArguments(key: key, businesses: businesses),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShowFullImageView({
    _i31.Key? key,
    required String imagePath,
    bool isFromFile = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.showFullImageView,
        arguments: ShowFullImageViewArguments(
            key: key, imagePath: imagePath, isFromFile: isFromFile),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddressSearchesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addressSearchesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecentSearchesView({
    _i31.Key? key,
    required List<String> recentSearches,
    required String nameKey,
    required String title,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.recentSearchesView,
        arguments: RecentSearchesViewArguments(
            key: key,
            recentSearches: recentSearches,
            nameKey: nameKey,
            title: title),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithServicesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.servicesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
