// Package imports:
import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
  String get domain;
  String get name;
}

@Environment(Environment.prod)
@LazySingleton(as: AppConfig)
class ProdAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => "$domain/wp-json/wp/v2";

  @override

  // TODO Replace with your WordPress webpage url
  String get domain => "https://www.yoursite.com";

  @override
  String get name => "WordPress App Prod";
}

@Environment(Environment.test)
@Environment(Environment.dev)
@LazySingleton(as: AppConfig)
class TestAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => "$domain/wp-json/wp/v2";

  @override
  String get domain => "https://www.yoursite.com";

  @override
  String get name => "WordPress App Dev";
}
