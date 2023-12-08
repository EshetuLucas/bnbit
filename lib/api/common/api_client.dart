import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/data_model/category/category.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:bnbit_app/exceptions/api_exceptions.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../../app/app.logger.dart';

class ApiClient {
  final log = getLogger('ApiClient');
  final _userService = locator<UserService>();
  final _firebaseAuthentication = locator<FirebaseAuthenticationService>();
  final Dio dio = Dio(BaseOptions(baseUrl: ''));
  Map<String, String>? headers;

  Future<void> setHeader({Map<String, String>? header}) async {
    String authorization = 'Bearer ' + await _userService.token;

    if (_firebaseAuthentication.hasUser) {
      headers = header ??
          {
            "Authorization": authorization,
            "Content-Type": "application/json",
          };
      dio.options.headers = headers;
      dio.options.headers.putIfAbsent("Content-Type", () => "application/json");
    }
  }

  List<T> listRawDataToModel<T>(
    rawData, {
    String? key,
    String? additionalKey,
  }) {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    if (key == null) {
      data = rawData;
    } else {
      data = rawData[key];
      log.d('data with: $key, and value: $data');
      if (additionalKey != null) {
        data = rawData[key][additionalKey];
      }
    }
    List<T> results = [];
    for (var element in data) {
      results.add(assignType<T>(element));
    }
    return results;
  }

  Future<T> put<T>(
    String endPoint,
    dynamic data, {
    String? modelKey,
    Map<String, dynamic>? queryParameters,
  }) async {
    await setHeader();
    log.i('endPoint:$endPoint,  queryParameters:$queryParameters');
    try {
      final request = dio.put(
        endPoint,
        options: Options(headers: headers, validateStatus: (status) => true),
        data: data,
        queryParameters: queryParameters,
      );
      return _handleResponse<T>(request, modelKey: modelKey);
    } catch (e) {
      log.e('Unable to update: $e');
      rethrow;
    }
  }

  /// Assigns type based on a given Type[T]
  assignType<T>(var data) {
    switch (T) {
      case UserModel:
        return data = UserModel.fromJson(data);
      case Category:
        return data = Category.fromJson(data);
      case Address:
        return data = Address.fromJson(data);
      case Business:
        return data = Business.fromJson(data);

      case Image:
        return data = Image.fromJson(data);

      default:
    }
  }

  Future<T> get<T>(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    String? key,
    String? modelKey,
    Options? options,
  }) async {
    await setHeader();
    log.i('endPoint:$endPoint');

    final request = dio.get(endPoint,
        options: options ??
            Options(headers: headers, validateStatus: (status) => true),
        queryParameters: {
          if (queryParameters != null) ...queryParameters,
        });

    return _handleResponse<T>(request, key: key, modelKey: modelKey);
  }

  Future<List<T>> getList<T>(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    String? key,
    String? additionalKey,
  }) async {
    await setHeader();
    log.i('endPoint:$endPoint, key:$key, queryParameters:$queryParameters');
    final request = dio.get(endPoint,
        options: Options(headers: headers, validateStatus: (status) => true),
        queryParameters: {
          if (queryParameters != null) ...queryParameters,
        });

    return _handleListResponse<T>(request,
        key: key, additionalKey: additionalKey);
  }

  Future<T> post<T>(
    String endPoint,
    dynamic data, {
    Map<String, dynamic> header = const {},
    Map<String, dynamic>? queryParameters,
    String? key,
    String? modelKey,
  }) async {
    await setHeader();
    log.i('endPoint:$endPoint, data:$data');
    final request = dio.post(
      endPoint,
      options: Options(headers: header, validateStatus: (status) => true),
      data: data,
      queryParameters: queryParameters,
    );
    return _handleResponse<T>(request, key: key, modelKey: modelKey);
  }

  Future<T> delete<T>(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    await setHeader();
    log.i('endPoint:$endPoint');
    try {
      final response = dio.delete(
        endPoint,
        options: Options(headers: headers, validateStatus: (status) => true),
        queryParameters: queryParameters,
      );
      return _handleResponse<T>(response);
    } catch (e) {
      log.e('Unable to delete: $e');
      rethrow;
    }
  }

  Future<List<T>> _handleListResponse<T>(
    Future<Response> request, {
    String? key,
    String? additionalKey,
  }) async {
    try {
      final response = await request;
      log.v('statusCode:${response.statusCode}');
      log.v('response:${response.data}');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final data = response.data;

        return listRawDataToModel<T>(data,
            key: key, additionalKey: additionalKey);
      } else {
        throw ApiErrorHandler.handleError(response.statusCode);
      }
    } catch (e) {
      log.e('Something went wrong: $e');
      rethrow;
    }
  }

  Future<T> _handleResponse<T>(
    Future<Response> request, {
    String? key,
    String? modelKey,
  }) async {
    try {
      final response = await request;
      log.v('response:$response');
      log.v('statusCode:${response.statusCode}');
      log.v('statusMessage:${response.statusMessage}');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        var data = response.data;
        log.v('raw:$data');
        if (key != null) data = data[key];
        if (modelKey != null) data = {modelKey: data};
        log.v('data:$data');
        return assignType<T>(data);
      } else {
        throw ApiErrorHandler.handleError(response.statusCode);
      }
    } catch (e) {
      log.e('Something went wrong: $e');
      rethrow;
    }
  }
}
