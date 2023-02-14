import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wordpress_flutter/app/data/service/api_service/api_service.dart';
import 'package:wordpress_flutter/core/config/config.dart';
import 'package:wordpress_flutter/core/di/locator.dart';
import 'package:wordpress_flutter/core/interceptor/error_interceptor.dart';

@module
abstract class AppModule {
  @lazySingleton
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

  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @preResolve
  Future<GetStorage> get initializeStorage async {
    var storageName = "wordpressFlutter";
    await GetStorage.init(storageName);
    return GetStorage(storageName);
  }

  @lazySingleton
  ApiService get injectApiService => ApiService(injectRetrofitAPI);

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
