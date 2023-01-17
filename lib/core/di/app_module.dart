import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wordpress_flutter/app/data/service/api_service.dart';
import 'package:wordpress_flutter/core/config.dart';
import 'package:wordpress_flutter/core/di/locator.dart';
import 'package:wordpress_flutter/core/interceptor/error_interceptor.dart';

@module
abstract class AppModule {
  @singleton
  Dio get injectRetrofitAPI {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: getIt<AppConfig>().baseUrl,
        connectTimeout: 100000,
        receiveTimeout: 100000,
        sendTimeout: 100000,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    dio.interceptors.add(ErrorInterceptor());
    return dio;
  }

  @lazySingleton
  ApiService get injectApiService => ApiService(injectRetrofitAPI);

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
