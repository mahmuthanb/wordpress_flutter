import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ListTile(
            title: Text("Domain"),
            subtitle: Text("www.mahmuthan.com"),
          ),
        ],
      ),
    );
  }
}
