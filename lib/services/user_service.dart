import 'dart:convert';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bnbit_app/api/user/user_apis.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
//import 'package:bnbit_app/service/device_info_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
//import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../data_model/user/user_model.dart';

class UserService {
  final log = getLogger('UserService');
  //final _deviceInfoService = locator<DeviceInfoService>();
  final _firebaseAuthentication = locator<FirebaseAuthenticationService>();
  //final _sharedPreferencesService = locator<SharedPreferencesService>();
  //final _databaseService = locator<DatabaseService>();
  final _userApis = locator<UserApis>();

  bool get hasUser => _currentUser != null;
  bool get hasLoggedInUser => true;
  //UserService_sharedPreferencesService.isUserLoggedIn;
  UserModel? _currentUser;
  UserModel get currentUser => _currentUser!;

  Future<String> get token async {
    return await _firebaseAuthentication.currentUser!.getIdToken() ?? '';
  }

  Future<void> updateUser(UserModel user) async {
    final result = await _userApis.updateUser(user);
    setCurrentUser(result);
  }

  // Future<void> createWithId({
  //   required String documentId,
  //   required UserModel payload,
  // }) async {
  //   log.v('documentId value "$documentId"');

  //   setCurrentUser(payload);
  // }

  Future<void> setCurrentUser(UserModel user) async {
    log.i('user:$user');
    _currentUser = user;

    // _sharedPreferencesService.setUserLoggedIn(true);
    // _sharedPreferencesService.saveToDisk(
    //   'loggedInUser',
    //   json.encode(_currentUser!),
    // );
    // await _databaseService.intHive(currentUser.id);
  }

  Future<UserModel> getUserById({
    required String userId,
  }) async {
    return await _userApis.getUserById(userId);
  }

  Future<void> logout() async {
    // final fcmTokens = {...currentUser.userfcmTokens};
    // fcmTokens.remove(await _deviceInfoService.getDeviceModel());
    // await onlyUpdate(
    //     documentId: currentUser.id, payload: {'userfcmTokens': fcmTokens});
    await _firebaseAuthentication.logout();
    // _sharedPreferencesService.setUserLoggedIn(false);
    // _sharedPreferencesService.saveToDisk(paymentModes, []);
    _currentUser = null;
  }

  /// This function deletes the user account
  /// This is required for the ios and android when uploading

  Future<void> deleteAccount() async {
    //await ref.doc(_currentUser!.uid).delete();
    await _firebaseAuthentication.currentUser!.delete();
    _currentUser = null;
  }

  // /// Generates an FCM token for a user's device. It will
  // /// append the device model with its corresponding FCM token.
  // Future<void> updateUserFcmToken({
  //   required UserModel user,
  //   String? deviceModel,
  //   String? fcmToken,
  // }) async {
  //   log.v('Registering new FCM token to device model "$deviceModel"');

  //   /// Add `fcmTokens` field with corresponding device model
  //   /// and its FCM token
  //   if (deviceModel != null && fcmToken != null) {
  //     Map<String, String> fcmTokens = {
  //       ...user.fcmTokens,
  //       deviceModel: fcmToken
  //     };
  //     await onlyUpdate(documentId: user.uid, payload: {'fcmTokens': fcmTokens});

  //     log.v('`fcmTokens` field has been updated user document "${user.id}"');
  //   }
  // }

  /// This function updates the user and sets the current user
  /// With the new updated user;
}
