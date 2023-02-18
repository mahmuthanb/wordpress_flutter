import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wordpress_flutter/app/router/router.dart';
import 'package:wordpress_flutter/app/router/router.routes.dart';
import 'package:wordpress_flutter/core/config/cubit/config_cubit.dart';
import 'package:wordpress_flutter/core/res/theme.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GetStorage _getStorage = GetStorage();
    final LocalDataSource _localDataSource = LocalDataSourceImpl(_getStorage);
    return BlocProvider(
      create: (context) => ConfigCubit(localDataSource: _localDataSource),
      child: BlocBuilder<ConfigCubit, ConfigState>(
        builder: (context, state) {
          if (state is ConfigInitial) {
            return MaterialApp(
              title: 'WordPress in Flutter',
              theme: AppTheme.theme(isDark: !(state.isDark)),
              debugShowCheckedModeBanner: false,
              initialRoute:
                  state.domainRegistered ? RouteMaps.home : RouteMaps.root,
              locale: state.locale,
              onGenerateRoute: onGenerateRoute,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
