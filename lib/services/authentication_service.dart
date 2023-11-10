import 'dart:io';

import 'package:bnbit_app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:tuple/tuple.dart';

class AuthenticationService with ListenableServiceMixin {
  final log = getLogger('AuthenticationService');

  AuthenticationService() {
    listenToReactiveValues([
      _verificationId,
    ]);
  }
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _userService = locator<UserService>();

  bool get isAppleSignInAvailable => Platform.isIOS;

  String? _verificationId;
  String? get verificationId => _verificationId;
  String? _otpCode;
  String? get otpCode => _otpCode;
  int? _forceResendToken;

  Future<FirebaseAuthenticationResult> createAccountWithEmail({
    required String email,
    required String password,
  }) async {
    log.v('email "$email", password "$password"');

    final result = await _firebaseAuthenticationService.createAccountWithEmail(
      email: email,
      password: password,
    );
    if (result.hasError) return result;
    await _createUser(result);

    return result;
  }

  Future<bool> _fetchIfUserExists(String uid) async {
    try {
      final user = await _userService.getUserById(userId: uid);
      if (user != null) {
        _userService.setCurrentUser(user);
      }
      return user != null;
    } catch (e) {
      log.e(e);
      return false;
    }
  }

  Future<FirebaseAuthenticationResult> loginWithEmail({
    required String email,
    required String password,
  }) async {
    log.v('Logging in with email "$email"');

    final result = await _firebaseAuthenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    if (result.hasError) return result;

    await _fetchIfUserExists(result.user!.uid);

    return result;
  }

  Future<bool> signInWithGoogle() async {
    try {
      final result = await _firebaseAuthenticationService.signInWithGoogle();
      if (!result.hasError) {
        return await _createUser(result);
      } else {
        throw Exception(result.errorMessage);
      }
    } catch (e) {
      log.e('Unable to signIn with google');
      rethrow;
    }
  }

  Future<bool> signInWithApple({
    required String? appleRedirectUri,
    required String? appleClientId,
  }) async {
    try {
      final result = await _firebaseAuthenticationService.signInWithApple(
        appleRedirectUri: appleRedirectUri,
        appleClientId: appleClientId,
      );
      if (!result.hasError) {
        return await _createUser(result);
      } else {
        throw Exception(result.errorMessage);
      }
    } catch (e) {
      log.e('Unable to sign in with apple:$e');
      rethrow;
    }
  }

  // Future<fb_auth.UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final result = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final facebookAuthCredential =
  //       fb_auth.FacebookAuthProvider.credential(result.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   final userCredential = await fb_auth.FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential);

  //   await _createUser(
  //     FirebaseAuthenticationResult(user: userCredential.user),
  //   );

  //   return userCredential;
  // }

  /// and register an FCM token, or that it's an existing user sign in via SSO.
  Future<bool> _createUser(FirebaseAuthenticationResult result) async {
    final user = result.user;
    if (user == null) return false;

    /// Apple sign in probably sends null name values on non-initial sign ons.
    /// This is to prevent overwriting of the saved names in this case
    final name = parseDisplayName(user.displayName);
    String firstName = '';
    String lasName = '';
    if (name.item1 != null) {
      firstName = name.item1 ?? '';
    }
    if (name.item2 != null) {
      lasName = name.item2 ?? '';
    }
    UserModel parsedUser = UserModel(
      first_name: firstName,
      last_name: lasName,
      id: user.uid,
      email: user.email ?? '',
      createdAt: DateTime.now(),
      phone: user.phoneNumber,
    );

    // Check if it's an existing user sign in via SSO.
    String token = await user.getIdToken() ?? '';
    log.d('token:$token');

    _userService.setCurrentUser(parsedUser);

    return await _checkAndCreateUser(parsedUser);
  }

  Future<bool> _checkAndCreateUser(UserModel user) async {
    // Check if it's an existing user sign in via SSO.
    bool userExists = await _fetchIfUserExists(user.id);

    // if (!userExists) {
    //   await _userService.createWithId(
    //     documentId: user.firebase_uuid,
    //     payload: user,
    //   );
    // }

    return userExists;
  }

  Tuple2<String?, String?> parseDisplayName(String? name) {
    final fullName = name?.split(' ') ?? [];
    Tuple2<String?, String?> parsedName = const Tuple2(null, null);

    if (fullName.isNotEmpty) {
      if (fullName.length >= 2) {
        parsedName = parsedName.withItem2(fullName.removeLast());
      }
      parsedName = parsedName.withItem1(fullName.join(' '));
    }
    return parsedName;
  }

  Future<bool> syncUserAccount() async {
    log.v('User id: ${_firebaseAuthenticationService.currentUser?.uid}');

    try {
      final user = await _userService.getUserById(
        userId:
            _firebaseAuthenticationService.currentUser?.uid ?? 'NOT_LOGGED_IN',
      );
      log.v('User: $user');

      _userService.setCurrentUser(user);

      log.i('User account information retrieved: $user');
      return true;
    } catch (e) {
      log.wtf(
        'Unable to sync user',
      );
    }
    return false;
  }

  Future<void> loginWithPhone({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    final mobileNumber = '+251' + phoneNumber;
    log.v('mobileNumber:$mobileNumber');

    try {
      final result =
          await _firebaseAuthenticationService.firebaseAuth.verifyPhoneNumber(
        forceResendingToken: _forceResendToken,
        phoneNumber: mobileNumber,
        verificationCompleted: (phoneAuthCredential) async {
          _otpCode = phoneAuthCredential.smsCode;
          notifyListeners();
          log.d(phoneAuthCredential.smsCode);
          log.d(phoneAuthCredential.smsCode);
          final result = await _firebaseAuthenticationService.firebaseAuth
              .signInWithCredential(phoneAuthCredential);
          await _createUser(FirebaseAuthenticationResult(user: result.user));
        },
        verificationFailed: (FirebaseAuthException error) {
          log.e('verificationFailed:$error');
          verificationFailed.call(error);
          // if (error.code == 'invalid-phone-number') {
          //   throw Exception('The provided phone number is not valid.');
          // }
        },
        codeSent: (verificationId, forceResendingToken) {
          log.d('verificationId:$verificationId');
          _forceResendToken = forceResendingToken;
          _verificationId = verificationId;
          codeSent.call(verificationId, forceResendingToken);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
          log.e('verificationId:$verificationId');
          codeAutoRetrievalTimeout.call(verificationId);
        },
      );

      //await _firebaseAuthService.verifyOtp(result, otp)

      return result;
    } catch (e) {
      log.e("Unable to login: $e");
      rethrow;
    }
  }

  Future<bool> verifyOTP(String otp) async {
    log.i('otp$otp');
    try {
      final result = await _firebaseAuthenticationService.firebaseAuth
          .signInWithCredential(PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      ));
      return await _createUser(
        FirebaseAuthenticationResult(user: result.user),
      );
    } catch (e) {
      log.e("Unable to verify otp: $e");
      rethrow;
    }
  }
}
