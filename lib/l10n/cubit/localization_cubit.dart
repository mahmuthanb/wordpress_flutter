import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';

part 'localization_state.dart';

@injectable
class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial(const Locale('en')));

  void changeLanguage(Locale newLocale) {
    emit(LocalizationInitial(newLocale));
  }
}
