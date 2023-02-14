part of 'localization_cubit.dart';

@immutable
abstract class LocalizationState extends BaseCubitState {}

class LocalizationInitial extends LocalizationState {
  final Locale locale;
  LocalizationInitial(this.locale);
}
