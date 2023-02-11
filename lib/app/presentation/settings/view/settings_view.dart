import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/presentation/settings/cubit/settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/view/wellcome_page.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/widget/shimmer.dart';
import 'package:wordpress_flutter/app/router/router.routes.dart';

@RouteMap()
class SettingsPage extends BaseWidget<SettingsCubit, SettingsState> {
  const SettingsPage({super.key});

  @override
  Widget build(
      BuildContext context, SettingsCubit viewModel, SettingsState state) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).titleSettings),
          elevation: 5,
          actions: [
            IconButton(
                onPressed: () {
                  viewModel.clearCache().then((_) {
                    const WellcomePage()
                        .pushAndRemoveUntil(context, (p0) => false);
                  });
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        backgroundColor: AppColors.white,
        body: Builder(
          builder: (context) {
            if (state is SettingsReady) {
              return ListView(
                children: [
                  // const Divider(height: AppDimens.s, thickness: 3),
                  ListTile(
                    title: Text(AppLocalizations.of(context).titleDomain),
                    subtitle: Text(state.domain!),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).titleAppName),
                    subtitle: Text(state.packageInfo.appName),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).titlePackageName),
                    subtitle: Text(state.packageInfo.packageName),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).titleVersion),
                    subtitle: Text(state.packageInfo.version),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).titleBuildNumber),
                    subtitle: Text(state.packageInfo.buildNumber),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).titleLocale),
                    subtitle: Text(state.locale!),
                  ),
                  ListTile(
                    title: Text("AppName in [${state.locale}]"),
                    subtitle: Text(AppLocalizations.of(context).appTitle),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).titleTheme),
                    subtitle: const Text("Light"),
                  )
                ],
              );
            } else {
              return ShimmerWidgets.rectangleShimmer;
            }
          },
        ));
  }
}
