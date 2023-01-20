import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:wordpress_flutter/app/presentation/connectivity/cubit/internet_cubit.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/wellcome.dart';
import 'package:wordpress_flutter/app/router.dart';
import 'package:wordpress_flutter/app/router.routes.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/widget/loading_view.dart';

class App extends BaseWidget<InternetCubit, InternetState> {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(
      BuildContext context, InternetCubit viewModel, InternetState state) {
    return MaterialApp(
      title: 'WordPress in Flutter',
      theme: ThemeData(primarySwatch: AppColors.primarySwatch),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteMaps.root, // defining the initial page
      onGenerateRoute: onGenerateRoute,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            if (state is InternetConnected &&
                state.connectivityResult != ConnectivityResult.none) {
              // return HomePage();
              return const WellcomePage();
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
