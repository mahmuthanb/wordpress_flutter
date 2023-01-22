import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/presentation/settings/cubit/settings_cubit.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';

@RouteMap()
class SettingsPage extends BaseWidget<SettingsCubit, SettingsState> {
  const SettingsPage({super.key});

  @override
  Widget build(
      BuildContext context, SettingsCubit viewModel, SettingsState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Domain"),
            subtitle: Text("www.mahmuthan.com"),
          ),
          ListTile(
            title: Text("App Name"),
            subtitle: Text("WordPress Flutter"),
          ),
          ListTile(
            title: Text("Version Number"),
            subtitle: Text("v1.2.3"),
          ),
          ListTile(
            title: Text("Build Number"),
            subtitle: Text("50"),
          ),
          ListTile(
            title: Text("Locale"),
            subtitle: Text("tr_TR"),
          ),
        ],
      ),
    );
  }
}
