import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/presentation/settings/cubit/settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/view/wellcome_page.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/widget/shimmer.dart';
import 'package:wordpress_flutter/app/router.routes.dart';

@RouteMap()
class SettingsPage extends BaseWidget<SettingsCubit, SettingsState> {
  const SettingsPage({super.key});

  @override
  Widget build(
      BuildContext context, SettingsCubit viewModel, SettingsState state) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
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
        body: Builder(
          builder: (context) {
            if (state is SettingsReady) {
              return ListView(
                children: [
                  ListTile(
                    title: const Text("Domain"),
                    subtitle: Text(state.domain!),
                  ),
                  ListTile(
                    title: const Text("App Name"),
                    subtitle: Text(state.packageInfo.appName),
                  ),
                  ListTile(
                    title: const Text("Package Name"),
                    subtitle: Text(state.packageInfo.packageName),
                  ),
                  ListTile(
                    title: const Text("Version Number"),
                    subtitle: Text(state.packageInfo.version),
                  ),
                  ListTile(
                    title: const Text("Build Number"),
                    subtitle: Text(state.packageInfo.buildNumber),
                  ),
                  ListTile(
                    title: const Text("Locale"),
                    subtitle: Text(state.locale!),
                  ),
                  ListTile(
                    title: Text("AppName in [${state.locale}]"),
                    subtitle: Text(AppLocalizations.of(context).appTitle),
                  ),
                  ListTile(
                    title: const Text("Theme"),
                    subtitle: Text(state.theme! ? "Dark" : "Light"),
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
