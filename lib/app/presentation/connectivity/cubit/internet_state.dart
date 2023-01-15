part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectivityResult connectivityResult;

  InternetConnected({required this.connectivityResult});
}

class InternetDisconnected extends InternetState {}
