part of 'config_cubit.dart';

@immutable
abstract class ConfigState extends BaseCubitState {}

class ConfigInitial extends ConfigState {
  final Locale? locale;
  ConfigInitial(this.locale);
}
