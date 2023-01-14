// Package imports:
import 'package:dio/dio.dart';
import 'package:wordpress_flutter/app/data/model/error_model/error_model.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);

      case DioErrorType.response:
        // switch (err.response?.statusCode) {
        //   case 400:
        //     throw BadRequestException(err.requestOptions);
        //   case 401:
        //     throw UnauthorizedException(err.requestOptions);
        //   case 404:
        //     throw NotFoundException(err.requestOptions);
        //   case 409:
        //     ErrorModel? model;
        //     try {
        //       model = ErrorModel.fromJson(err.response!.data);
        //     } catch (e) {
        //       throw DioException(
        //           "Bilinmeyen bir sorun oluştu.", err.requestOptions);
        //     }
        //     throw DioException(
        //         model.messages?.first ?? "-", err.requestOptions);
        //   //throw ConflictException(err.requestOptions);
        //   case 500:
        //     throw InternalServerErrorException(err.requestOptions);
        // }
        // break;
        ErrorModel? model;
        try {
          model = ErrorModel.fromJson(err.response!.data);
        } catch (e) {
          throw DioException(
              "Bilinmeyen bir sorun oluştu.", err.requestOptions);
        }
        throw DioException(model.messages?.first ?? "-", err.requestOptions);
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }
    return super.onError(err, handler);
  }
}

class DioException extends DioError {
  DioException(String message, RequestOptions r)
      : super(requestOptions: r, error: message);

  @override
  String toString() {
    return message;
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bilinmeyen bir hata oluştu, lütfen daha sonra tekrar deneyin.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'İnternet bağlantısı bulunamadı, tekrar deneyin.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bağlantı zaman aşımına uğradı, tekrar deneyin.';
  }
}

class CancelException extends DioError {
  CancelException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Yetkisiz işlem.';
  }
}
