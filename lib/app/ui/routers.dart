import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/modules/auth/profile/profile_page.dart';
import 'modules/home/home_page.dart';
import 'modules/root/splash/splash_page.dart';
import 'modules/auth/login/login_page.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashPage(),
    login: (BuildContext context) => const LoginPage(),
    home: (BuildContext context) => const HomePage(),
    profile: (BuildContext context) => const ProfilePage(),
  };
}
