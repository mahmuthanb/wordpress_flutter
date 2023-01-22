import 'package:flutter/material.dart';
import 'package:wordpress_flutter/app/presentation/connectivity/cubit/internet_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wordpress_flutter/app/router.dart';
import 'package:wordpress_flutter/app/router.routes.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/colors.dart';

class App extends BaseWidget<InternetCubit, InternetState> {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(
      BuildContext context, InternetCubit viewModel, InternetState state) {
    return MaterialApp(
      title: 'WordPress in Flutter',
      theme: ThemeData(primarySwatch: AppColors.primarySwatch),
      debugShowCheckedModeBanner: false,
      initialRoute:
          viewModel.domainRegistered ? RouteMaps.home : RouteMaps.root,
      onGenerateRoute: onGenerateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
