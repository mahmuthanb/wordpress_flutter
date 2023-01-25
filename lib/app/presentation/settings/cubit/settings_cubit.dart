import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final LocalDataSource localDataSource;
  String? domain;
  String? locale;
  bool? theme;
  SettingsCubit(this.localDataSource) : super(SettingsInitial()) {
    PackageInfo.fromPlatform().then(
      (value) {
        locale = Platform.localeName;
        domain = localDataSource.domain;
        theme = localDataSource.darkTheme;
        emit(SettingsReady(value, locale!, domain, theme));
      },
    );
  }
}
