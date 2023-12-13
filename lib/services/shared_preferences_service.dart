//import 'dart:ui';

import 'package:bnbit_app/app/app.logger.dart';
//import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final log = getLogger('SharedPreferencesService');
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  final bool? enableLogs;
  SharedPreferencesService({this.enableLogs = true});
  static Future<SharedPreferencesService> getInstance(
      {bool enableLogs = false}) async {
    _instance ??= SharedPreferencesService(enableLogs: enableLogs);
    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  void dispose() {
    log.i('');
    _preferences?.clear();
  }

  static const _isUserLoggedInKey = 'isUserLoggedIn';
  static const _freshInstall = "fresh_install";
  static const _isEnglish = "isEnglish";
  static const _isAppLocked = "app_lock";
  static const _isDarkMode = "dark_mode";
  static const _isDailyNetOn = "daily_net";
  static const _showUpdateDialog = "showUpdateDialog";
  static const _businessIdsWithBooks = "businessIdsWithBooks";
  static const _booksIdsWithEntries = "booksIdsWithEntries";

  bool get isUserLoggedIn =>
      (getFromDisk(_isUserLoggedInKey) as bool?) ?? false;
  bool get hasAppLock => (getFromDisk(_isAppLocked) as bool?) ?? false;

  bool? get isEnglish => (getFromDisk(_isEnglish) as bool?);
  bool get freshInstall => (getFromDisk(_freshInstall) as bool?) ?? true;
  bool get isDailyNetOn => (getFromDisk(_isDailyNetOn) as bool?) ?? false;
  bool get showUpdateDialog =>
      (getFromDisk(_showUpdateDialog) as bool?) ?? true;

  // bool get isDarkMode {
  //   final result = getFromDisk(_isDarkMode);
  //   if (result != null) {
  //     if (result == DarkModeType.dark.name) {
  //       return true;
  //     } else if (result == DarkModeType.light.name) {
  //       return false;
  //     }
  //   }

  //   return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
  //       Brightness.dark;
  // }

  /// These are to check if the books has been called and stored locally
  /// The same goes for entries
  List<String> get businessIdsWithBooks =>
      (getList(_businessIdsWithBooks) ?? ['']);
  List<String> get booksIdsWithEntries =>
      (getList(_booksIdsWithEntries) ?? ['']);

  // String get theme => getFromDisk(_isDarkMode) ?? DarkModeType.system.name;

  set freshInstall(bool value) => saveToDisk(_freshInstall, value);

  void setUserLoggedIn(bool value) => saveToDisk(_isUserLoggedInKey, value);
  void setAppLock(bool value) => saveToDisk(_isAppLocked, value);
  void setEnglish(bool value) => saveToDisk(_isEnglish, value);
  void setDarkMode(String value) => saveToDisk(_isDarkMode, value);
  void setDailyNet(bool value) => saveToDisk(_isDailyNetOn, value);
  void setShowUpdateDialog(bool value) => saveToDisk(_showUpdateDialog, value);
  void setBooksIdsWithEntries(List<String> booksId) =>
      saveToDisk(_booksIdsWithEntries, booksId);
  void setBusinessIdsWithBooks(List<String> businessesId) =>
      saveToDisk(_businessIdsWithBooks, businessesId);

  dynamic getFromDisk(String key) {
    var value = _preferences?.get(key);
    if (enableLogs!) log.v('key:$key value:$value');
    return value;
  }

  List<String>? getList(String key) {
    List<String>? value = _preferences?.getStringList(key);
    if (enableLogs!) log.v('key:$key value:$value');
    return value;
  }

  dynamic getEntertainerId(String key) {
    var value = _preferences!.getString(key);
    //if (enableLogs) log.v('key:$key value:$value');
    return value;
  }

  dynamic getKeys() => _preferences!.getKeys();
  void setEntertainerId(String key, String content) {
    _preferences!.setString(key, content);
  }

  void saveToDisk(String key, dynamic content) {
    if (enableLogs!) log.v('key:$key value:$content');

    if (content is String) {
      _preferences?.setString(key, content);
    }
    if (content is bool) {
      _preferences?.setBool(key, content);
    }
    if (content is int) {
      _preferences?.setInt(key, content);
    }
    if (content is double) {
      _preferences?.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences?.setStringList(key, content);
    }
  }
}
