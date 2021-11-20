import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/app/ui/modules/auth/login/login_page.dart';
import 'package:flutter_architecture/app/ui/modules/auth/profile/profile_page.dart';
import 'package:flutter_architecture/app/ui/modules/home/home_page.dart';
import 'package:flutter_architecture/app/ui/modules/root/splash/splash_page.dart';
import 'package:flutter_architecture/app/ui/routers.dart';
import 'package:get_it/get_it.dart';

class InjectorPage{
  static Future setup(GetIt inject) async {
    inject.registerFactory<Widget>(() => const SplashPage(), instanceName: Routes.splash);
    inject.registerFactory<Widget>(() => const HomePage(), instanceName: Routes.home);
    inject.registerFactory<Widget>(() => const ProfilePage(), instanceName: Routes.profile);
    inject.registerFactory<Widget>(() => LoginPage(bloc: inject()), instanceName: Routes.login);
  }
}