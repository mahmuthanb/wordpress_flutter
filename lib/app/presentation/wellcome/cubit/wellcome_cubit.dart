import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
part 'wellcome_state.dart';

@injectable
class WellcomeCubit extends Cubit<WellcomeState> {
  WellcomeCubit(this.localDataSource) : super(WellcomeInitial());
  final LocalDataSource localDataSource;

  bool? _isValid;
  bool? get isValid => _isValid;
  set setValid(bool? value) {
    _isValid = value;
  }

  Future onSave(String? value) => localDataSource.setDomain(value);
  List<Locale> get listOfLocales => AppLocalizations.supportedLocales;
  Locale get deviceLocale => Locale(Platform.localeName.split('_')[0]);
}
