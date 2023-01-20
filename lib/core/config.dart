// Package imports:
import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

abstract class AppConfig {
  String get baseUrl;
  // String get domain;
  String get name;
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@LazySingleton(as: AppConfig)
class ProdAppConfigImpl extends AppConfig {
  final LocalDataSource localDataSource;
  ProdAppConfigImpl(this.localDataSource);
  @override
  String get baseUrl => "${localDataSource.domain}/wp-json/wp/v2";

  @override
  String get name => "WordPress App Prod";
}

@Environment(Environment.test)
@LazySingleton(as: AppConfig)
class TestAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => "www.testdomain.com/wp-json/wp/v2";

  @override
  String get name => "WordPress App Dev";
}
