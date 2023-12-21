import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.router.dart';
import 'package:bnbit_app/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

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
  static Exception handleError(int? statusCode) {
    final _navigationService = locator<NavigationService>();
    final _userService = locator<UserService>();

    if (statusCode != null) {
      switch (statusCode) {
        case 400:
          return BadRequestException(message: 'BadRequestException');
        case 401:
          if (_userService.hasUser) {
            _navigationService.clearStackAndShow(Routes.loginView);
          }
          return UnauthorizedException(message: 'UnauthorizedException');

        case 403:
          return ForbiddenException(message: 'ForbiddenException');
        case 404:
          return NotFoundException(message: 'NotFoundException');
        case 409:
          return ConflictException(message: 'ConflictException');
        case 500:
          return InternalServerErrorException(
              message: 'InternalServerErrorException');
        case 502:
          return BadGatewayException(message: 'BadGatewayException');
        case 503:
          return ServiceUnavailableException(
              message: 'ServiceUnavailableException');
        default:
          return ApiException(message: 'Something went wrong');
      }
    }
    return ApiException(message: 'Something went wrong');
  }
}
