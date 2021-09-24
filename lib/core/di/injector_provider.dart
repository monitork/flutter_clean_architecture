import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:flutter_architecture/app/data/remote/auth.provider.dart';
import 'package:flutter_architecture/app/data/remote/user.provider.dart';
import 'package:flutter_architecture/app/services/auth_service.dart';
import 'package:flutter_architecture/app/services/navigation_service.dart';
import 'package:flutter_architecture/app/ui/modules/home/home_view_model.dart';
import 'package:flutter_architecture/app/ui/modules/auth/login/login_view_model.dart';
import 'package:flutter_architecture/core/di/http_client.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  //Components
  inject.registerSingleton(HttpClient());

  //Remote Services
  inject.registerFactory(() => AuthProvider());
  inject.registerFactory(() => UserProvider());

  //Repositories
  inject.registerFactory(() => AuthRepository());

  // Services
  inject.registerLazySingleton(() => AuthService());
  inject.registerLazySingleton(() => NavigationService());
  //ViewModels
  inject.registerLazySingleton(() => LoginViewModel());
  inject.registerLazySingleton(() => HomeViewModel());
}