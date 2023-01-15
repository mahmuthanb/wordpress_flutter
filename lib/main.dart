import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/app/presentation/connectivity/cubit/internet_cubit.dart';
import 'package:wordpress_flutter/app/presentation/home_page/home_page.dart';
import 'package:wordpress_flutter/core/di/locator.dart';
import 'package:wordpress_flutter/core/widget/info_message.dart';
import 'package:wordpress_flutter/core/widget/loading_view.dart';

void main() {
  setupDI(Environment.dev);
  runApp(const WordPressFlutter());
}

class WordPressFlutter extends StatelessWidget {
  const WordPressFlutter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Connectivity connectivity = Connectivity();
    return MaterialApp(
      title: 'WordPress in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (BuildContext context) =>
                InternetCubit(connectivity: connectivity),
          ),
        ],
        child: Scaffold(
          body: BlocListener<InternetCubit, InternetState>(
            listener: (context, state) {
              InfoMessage(
                      message: "Internet connected",
                      status: MessageStatus.success)
                  .snack(context);
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
