import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widget;
    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e) {
      widget = Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      );
    }
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (_) => widget, settings: settings)
        : MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}
