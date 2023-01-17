import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_flutter/app/data/repository/common_repository.dart';
import 'package:wordpress_flutter/app/data/repository/posts_repository.dart';
import 'package:wordpress_flutter/app/data/service/api_service.dart';
import 'package:wordpress_flutter/app/presentation/connectivity/cubit/internet_cubit.dart';
import 'package:wordpress_flutter/app/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:wordpress_flutter/app/presentation/home_page/home_page.dart';
import 'package:wordpress_flutter/core/di/locator.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/widget/info_message.dart';
import 'package:wordpress_flutter/core/widget/loading_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Connectivity connectivity = Connectivity();
    final CommonRepositoryImpl commonRepository =
        CommonRepositoryImpl(getIt<ApiService>());
    return MaterialApp(
      title: 'WordPress in Flutter',
      theme: ThemeData(primarySwatch: AppColors.primarySwatch),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (BuildContext context) =>
                InternetCubit(connectivity: connectivity),
          ),
          BlocProvider<HomePageCubit>(
            create: (context) => HomePageCubit(commonRepository),
          )
        ],
        child: Scaffold(
          body: BlocListener<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is InternetConnected) {
                InfoMessage(
                        message:
                            'Internet connected via ${state.connectivityResult.name}',
                        status: MessageStatus.success)
                    .snack(context);
              }
            },
            child: BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectivityResult != ConnectivityResult.none) {
                  return HomePage();
                } else if (state is InternetDisconnected) {
                  return const LoadingScreen(title: "Disconnected");
                } else {
                  return const LoadingScreen();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
