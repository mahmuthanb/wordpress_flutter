import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/router/router.routes.dart';

@RouteMapInit()
Route? onGenerateRoute(RouteSettings routeSettings) =>
    $onGenerateRoute(routeSettings);
