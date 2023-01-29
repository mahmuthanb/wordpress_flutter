// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:wordpress_flutter/app/presentation/settings/view/settings_view.dart';
import 'package:wordpress_flutter/app/presentation/home_page/home_page.dart';
import 'package:wordpress_flutter/app/presentation/category/view/category_page.dart';
import 'package:wordpress_flutter/app/presentation/post_detail/view/post_detail_screen.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/view/wellcome_page.dart';

class RouteMaps {
  static String settingsPage = "/settings_page";
  static String home = "home";
  static String category = "category";
  static String postDetailPage = "/post_detail_page";
  static String root = "/";
}

final Map<String, RouteModel> _routes = {
  RouteMaps.settingsPage: RouteModel(
    (_) => const SettingsPage(),
  ),
  RouteMaps.home: RouteModel(
    (_) => const HomePage(),
  ),
  RouteMaps.category: RouteModel(
    (c) => CategoryPage(
      cat: c.routeArgs()?["cat"],
    ),
  ),
  RouteMaps.postDetailPage: RouteModel(
    (c) => PostDetailPage(
      post: c.routeArgs()?["post"],
    ),
  ),
  RouteMaps.root: RouteModel(
    (_) => const WellcomePage(),
  ),
};
Route? $onGenerateRoute(RouteSettings routeSettings) {
  RouteModel? route = _routes[routeSettings.name];
  if (route == null) {
    return null;
  }
  return MaterialPageRoute(
      builder: route.builder,
      settings: routeSettings,
      fullscreenDialog: route.fullscreenDialog);
}

extension RouteSettingsExtension on RouteSettings {
  T? routeArgs<T>() => arguments as T;
}

extension BuildContextExtension on BuildContext {
  NavigatorState navigator() => Navigator.of(this);
  NavigatorState rootNavigator() => Navigator.of(this, rootNavigator: true);
  T? routeArgs<T>() => ModalRoute.of(this)?.settings.arguments as T;
}

class RouteModel {
  WidgetBuilder builder;
  bool fullscreenDialog;
  RouteModel(
    this.builder, {
    this.fullscreenDialog = false,
  });
}

extension SettingsPageExtension on SettingsPage {
  Future<T?> push<T extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamed(RouteMaps.settingsPage);
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushReplacementNamed(RouteMaps.settingsPage, result: result);
  Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .popAndPushNamed(RouteMaps.settingsPage, result: result);
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(RouteMaps.settingsPage, predicate);
  String restorablePush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushNamed(RouteMaps.settingsPage);
  String restorablePushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushNamedAndRemoveUntil(RouteMaps.settingsPage, predicate);
  String restorablePopAndPush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePopAndPushNamed(RouteMaps.settingsPage);
  String restorablePushReplacement(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushReplacementNamed(RouteMaps.settingsPage);
}

extension HomePageExtension on HomePage {
  Future<T?> push<T extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamed(RouteMaps.home);
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushReplacementNamed(RouteMaps.home, result: result);
  Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .popAndPushNamed(RouteMaps.home, result: result);
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(RouteMaps.home, predicate);
  String restorablePush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushNamed(RouteMaps.home);
  String restorablePushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushNamedAndRemoveUntil(RouteMaps.home, predicate);
  String restorablePopAndPush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePopAndPushNamed(RouteMaps.home);
  String restorablePushReplacement(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushReplacementNamed(RouteMaps.home);
}

extension CategoryPageExtension on CategoryPage {
  Object get _args => {
        "cat": cat,
      };
  Future<T?> push<T extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator).pushNamed(
        RouteMaps.category,
        arguments: _args,
      );
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator).pushReplacementNamed(
        RouteMaps.category,
        result: result,
        arguments: _args,
      );
  Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator).popAndPushNamed(
        RouteMaps.category,
        result: result,
        arguments: _args,
      );
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(
        RouteMaps.category,
        predicate,
        arguments: _args,
      );
  String restorablePush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator).restorablePushNamed(
        RouteMaps.category,
        arguments: _args,
      );
  String restorablePushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushNamedAndRemoveUntil(
        RouteMaps.category,
        predicate,
        arguments: _args,
      );
  String restorablePopAndPush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePopAndPushNamed(
        RouteMaps.category,
        arguments: _args,
      );
  String restorablePushReplacement(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushReplacementNamed(
        RouteMaps.category,
        arguments: _args,
      );
}

extension PostDetailPageExtension on PostDetailPage {
  Object get _args => {
        "post": post,
      };
  Future<T?> push<T extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator).pushNamed(
        RouteMaps.postDetailPage,
        arguments: _args,
      );
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator).pushReplacementNamed(
        RouteMaps.postDetailPage,
        result: result,
        arguments: _args,
      );
  Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator).popAndPushNamed(
        RouteMaps.postDetailPage,
        result: result,
        arguments: _args,
      );
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(
        RouteMaps.postDetailPage,
        predicate,
        arguments: _args,
      );
  String restorablePush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator).restorablePushNamed(
        RouteMaps.postDetailPage,
        arguments: _args,
      );
  String restorablePushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushNamedAndRemoveUntil(
        RouteMaps.postDetailPage,
        predicate,
        arguments: _args,
      );
  String restorablePopAndPush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePopAndPushNamed(
        RouteMaps.postDetailPage,
        arguments: _args,
      );
  String restorablePushReplacement(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushReplacementNamed(
        RouteMaps.postDetailPage,
        arguments: _args,
      );
}

extension WellcomePageExtension on WellcomePage {
  Future<T?> push<T extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamed(RouteMaps.root);
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushReplacementNamed(RouteMaps.root, result: result);
  Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    BuildContext context, {
    bool rootNavigator = false,
    TO? result,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .popAndPushNamed(RouteMaps.root, result: result);
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(RouteMaps.root, predicate);
  String restorablePush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushNamed(RouteMaps.root);
  String restorablePushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    bool Function(Route<dynamic>) predicate, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushNamedAndRemoveUntil(RouteMaps.root, predicate);
  String restorablePopAndPush(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePopAndPushNamed(RouteMaps.root);
  String restorablePushReplacement(
    BuildContext context, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .restorablePushReplacementNamed(RouteMaps.root);
}
