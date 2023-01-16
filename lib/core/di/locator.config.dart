// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:wordpress_flutter/app/data/repository/posts_repository.dart'
    as _i6;
import 'package:wordpress_flutter/app/data/service/api_service.dart' as _i3;
import 'package:wordpress_flutter/core/config.dart' as _i4;
import 'package:wordpress_flutter/core/di/app_module.dart' as _i7;

const String _prod = 'prod';
const String _test = 'test';
const String _dev = 'dev';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiService>(() => appModule.injectApiService);
    gh.lazySingleton<_i4.AppConfig>(
      () => _i4.ProdAppConfigImpl(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i4.AppConfig>(
      () => _i4.TestAppConfigImpl(),
      registerFor: {
        _test,
        _dev,
      },
    );
    gh.singleton<_i5.Dio>(appModule.injectRetrofitAPI);
    gh.lazySingleton<_i6.PostsRepository>(
        () => _i6.PostsRepositoryImpl(gh<_i3.ApiService>()));
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}
