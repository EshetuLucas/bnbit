import 'dart:io';

import 'package:bnbit_app/api/common/api_client.dart';
import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:dio/dio.dart';

String updateUserUrl = baseUrl + '/accounts/update-user';
String sendOtpUrl = baseUrl + '/accounts/send-otp';
String verifyOtpUrl = baseUrl + '/accounts/verify-otp';

//check it now http://ec2-54-161-157-16.compute-1.amazonaws.com/accounts/update-user/<id>

mixin PostApis {
  final log = getLogger('UserPostApis');
  ApiClient get apiClient => ApiClient();

  Future<UserModel> updateUser(
    UserModel user, {
    File? image,
  }) async {
    var formData;

    Map<String, dynamic> userJson = user.toJson();
    userJson.remove('profile_picture');

    if (image != null) {
      userJson.remove('saved_business');
      log.i('userJson:$userJson');
      formData = FormData.fromMap({
        ...userJson,
        'profile_picture': await MultipartFile.fromFile(image.path)
      });
    } else {
      formData = userJson;
    }
    log.i('formData:$formData');

    return await apiClient.put<UserModel>(
      updateUserUrl + "/${user.id}",
      formData,
    );
  }

  Future<void> sendEmailVerificationCode(String email) async {
    return await apiClient.post<void>(
      sendOtpUrl,
      {
        'email': email,
      },
    );
  }

  Future<void> verifyOTPCode({
    required String email,
    required String otp,
  }) async {
    return await apiClient.post<void>(
      verifyOtpUrl,
      {
        'email': email,
        'otp': otp,
      },
    );
  }
}
