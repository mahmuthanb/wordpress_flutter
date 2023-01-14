// Package imports:
import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
  String get name;
}

@Environment(Environment.prod)
@LazySingleton(as: AppConfig)
class ProdAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => "https://www.mahmuthan.com";
  @override
  String get name => "WordPress App Prod";
}

@Environment(Environment.test)
@LazySingleton(as: AppConfig)
class TestAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => "https://www.mahmuthan.com";

  @override
  String get name => "WordPress App Dev";
}
