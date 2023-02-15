part of 'config_cubit.dart';

@immutable
abstract class ConfigState extends BaseCubitState {}

class ConfigInitial extends ConfigState {
  final Locale? locale;
  final bool? domainRegistered;
  final bool? isDark;
  ConfigInitial({this.locale, this.isDark, this.domainRegistered});
}
