import 'package:flutter/material.dart';
import 'modules/home/home.page.dart';
import 'modules/root/splash/splash_page.dart';
import 'modules/auth/login/login.page.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashPage(),
    login: (BuildContext context) => const LoginPage(),
    home: (BuildContext context) => const HomePage(),
  };
}
