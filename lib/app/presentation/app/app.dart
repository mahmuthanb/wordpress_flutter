import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_flutter/app/presentation/connectivity/cubit/internet_cubit.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/wellcome.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/widget/info_message.dart';
import 'package:wordpress_flutter/core/widget/loading_view.dart';

class App extends BaseWidget<InternetCubit, InternetState> {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(
      BuildContext context, InternetCubit viewModel, InternetState state) {
    // final Connectivity connectivity = Connectivity();
    // final CommonRepositoryImpl commonRepository =
    //     CommonRepositoryImpl(getIt<ApiService>());
    return MaterialApp(
      title: 'WordPress in Flutter',
      theme: ThemeData(primarySwatch: AppColors.primarySwatch),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            if (state is InternetConnected &&
                state.connectivityResult != ConnectivityResult.none) {
              // return HomePage();
              return WellcomePage();
            } else if (state is InternetDisconnected) {
              return const LoadingScreen(title: "Disconnected");
            } else {
              return const LoadingScreen();
            }
          },
        ),
      ),
      // ),
    );
  }
}
