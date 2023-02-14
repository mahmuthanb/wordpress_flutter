import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

part 'config_state.dart';

@injectable
class ConfigCubit extends Cubit<ConfigState> {
  final LocalDataSource localDataSource;

  ConfigCubit({
    required this.localDataSource,
  }) : super(ConfigInitial(const Locale("en")));

  bool checkDomainRegistered() {
    if (localDataSource.domain != null && localDataSource.domain!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool get domainRegistered => checkDomainRegistered();
  bool get isDark => localDataSource.darkTheme ?? false;
  set changeTheme(bool value) => localDataSource.setDarkTheme(value);

  Locale get locale => _locale;
  Locale _locale = const Locale("en");
  set changeLanguage(Locale newLocale) => _locale = newLocale;
}
