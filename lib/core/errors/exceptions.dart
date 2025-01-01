import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    // ! Client Error
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    // ! Server Error
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400: // Bad request
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 401: // Unauthorized
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 403: // Forbidden
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 404: // Not Found
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 409: // Conflict
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 422: // Unprocessable Entity
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 504: // Gateway Timeout
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        default:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}