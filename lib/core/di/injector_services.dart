import 'package:flutter_architecture/app/services/auth_service.dart';
import 'package:flutter_architecture/app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

class InjectorServices{
  static Future setup(GetIt inject) async {
    inject.registerLazySingleton(() => AuthService());
    inject.registerLazySingleton(() => NavigationService());
  }
}