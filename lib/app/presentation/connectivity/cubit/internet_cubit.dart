import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

part 'internet_state.dart';

@injectable
class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  final LocalDataSource localDataSource;
  late StreamSubscription connectivityStreamSubscription;
  InternetCubit({
    required this.connectivity,
    required this.localDataSource,
  }) : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult != ConnectivityResult.none) {
        emitInternetConnected(connectivityResult);
      } else {
        emitInternetDisconnected();
      }
    });
  }
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

  void emitInternetConnected(ConnectivityResult connectivityResult) =>
      emit(InternetConnected(connectivityResult: connectivityResult));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
