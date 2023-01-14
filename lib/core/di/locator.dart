// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'locator.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
GetIt setupDI(String environment) => getIt.init(environment: environment);
