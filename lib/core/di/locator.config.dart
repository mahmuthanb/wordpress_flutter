// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:wordpress_flutter/app/data/repository/common_repository.dart'
    as _i5;
import 'package:wordpress_flutter/app/data/repository/posts_repository.dart'
    as _i12;
import 'package:wordpress_flutter/app/data/service/api_service/api_service.dart'
    as _i3;
import 'package:wordpress_flutter/app/presentation/app/cubit/test_cubit.dart'
    as _i14;
import 'package:wordpress_flutter/app/presentation/category/cubit/category_cubit.dart'
    as _i16;
import 'package:wordpress_flutter/app/presentation/connectivity/cubit/internet_cubit.dart'
    as _i18;
import 'package:wordpress_flutter/app/presentation/home_page/cubit/home_page_cubit.dart'
    as _i17;
import 'package:wordpress_flutter/app/presentation/post_detail/cubit/post_detail_cubit.dart'
    as _i11;
import 'package:wordpress_flutter/app/presentation/settings/cubit/settings_cubit.dart'
    as _i13;
import 'package:wordpress_flutter/app/presentation/wellcome/cubit/wellcome_cubit.dart'
    as _i15;
import 'package:wordpress_flutter/core/config/config.dart' as _i4;
import 'package:wordpress_flutter/core/di/app_module.dart' as _i19;
import 'package:wordpress_flutter/core/source/local_data_source.dart' as _i9;
import 'package:wordpress_flutter/l10n/cubit/localization_cubit.dart' as _i10;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiService>(() => appModule.injectApiService);
    gh.lazySingleton<_i4.AppConfig>(
      () => _i4.TestAppConfigImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i5.CommonRepository>(
        () => _i5.CommonRepositoryImpl(gh<_i3.ApiService>()));
    gh.lazySingleton<_i6.Connectivity>(() => appModule.connectivity);
    gh.lazySingleton<_i7.Dio>(() => appModule.injectRetrofitAPI);
    await gh.factoryAsync<_i8.GetStorage>(
      () => appModule.initializeStorage,
      registerFor: {
        _dev,
        _prod,
      },
      preResolve: true,
    );
    gh.lazySingleton<_i9.LocalDataSource>(
      () => _i9.LocalDataSourceImpl(gh<_i8.GetStorage>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i10.LocalizationCubit>(() => _i10.LocalizationCubit());
    gh.factory<_i11.PostDetailCubit>(() => _i11.PostDetailCubit());
    gh.lazySingleton<_i12.PostsRepository>(
        () => _i12.PostsRepositoryImpl(gh<_i3.ApiService>()));
    gh.factory<_i13.SettingsCubit>(
        () => _i13.SettingsCubit(gh<_i9.LocalDataSource>()));
    gh.factory<_i14.TestCubit>(() => _i14.TestCubit());
    gh.factory<_i15.WellcomeCubit>(
        () => _i15.WellcomeCubit(gh<_i9.LocalDataSource>()));
    gh.lazySingleton<_i4.AppConfig>(
      () => _i4.ProdAppConfigImpl(gh<_i9.LocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i16.CategoryCubit>(() => _i16.CategoryCubit(
          gh<_i5.CommonRepository>(),
          gh<_i9.LocalDataSource>(),
        ));
    gh.factory<_i17.HomePageCubit>(() => _i17.HomePageCubit(
          gh<_i5.CommonRepository>(),
          gh<_i9.LocalDataSource>(),
        ));
    gh.factory<_i18.InternetCubit>(() => _i18.InternetCubit(
          connectivity: gh<_i6.Connectivity>(),
          localDataSource: gh<_i9.LocalDataSource>(),
        ));
    return this;
  }
}

class _$AppModule extends _i19.AppModule {}
