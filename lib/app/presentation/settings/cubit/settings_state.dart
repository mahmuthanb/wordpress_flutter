part of 'settings_cubit.dart';

@immutable
abstract class SettingsState extends BaseCubitState {}

class SettingsInitial extends SettingsState {}

class SettingsReady extends SettingsState {
  final PackageInfo packageInfo;
  final String? domain;
  final String? locale;
  SettingsReady(this.packageInfo, this.locale, this.domain);
}
