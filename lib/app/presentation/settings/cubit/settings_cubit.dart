import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
}
