import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String? message;

  ApiException({required this.message});

  @override
  String toString() => message ?? 'unknown error';
}

class BadRequestException extends ApiException {
  BadRequestException({String? message}) : super(message: message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({String? message}) : super(message: message);
}

class ForbiddenException extends ApiException {
  ForbiddenException({String? message}) : super(message: message);
}

class NotFoundException extends ApiException {
  NotFoundException({String? message}) : super(message: message);
}

class ConflictException extends ApiException {
  ConflictException({String? message}) : super(message: message);
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException({String? message}) : super(message: message);
}

class BadGatewayException extends ApiException {
  BadGatewayException({String? message}) : super(message: message);
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException({String? message}) : super(message: message);
}

class ApiErrorHandler {
  static Exception handleError(error) {
    if (error?.response is Response) {
      final e = error?.response;

      if (e?.statusCode != null) {
        switch (e.statusCode) {
          case 400:
            return BadRequestException(message: e.statusMessage);
          case 401:
            return UnauthorizedException(message: e.statusMessage);
          case 403:
            return ForbiddenException(message: e.statusMessage);
          case 404:
            return NotFoundException(message: e.statusMessage);
          case 409:
            return ConflictException(message: e.statusMessage);
          case 500:
            return InternalServerErrorException(message: e.statusMessage);
          case 502:
            return BadGatewayException(message: e.statusMessage);
          case 503:
            return ServiceUnavailableException(message: e.statusMessage);
          default:
            return ApiException(
                message: e.statusMessage ?? 'Something went wrong');
        }
      }
      return ApiException(message: 'Something went wrong');
    }
    if (error?.message != null) {
      if (error.message.toString().contains('SocketException')) {
        return ApiException(message: 'Please check your internet connection');
      } else {
        return ApiException(message: 'Something went wrong');
      }
    }

    return ApiException(message: error.toString());
  }
}
