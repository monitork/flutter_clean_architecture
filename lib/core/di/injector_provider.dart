import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:flutter_architecture/app/data/remote/auth.provider.dart';
import 'package:flutter_architecture/app/data/remote/user.provider.dart';
import 'package:flutter_architecture/app/ui/modules/home/home.view_model.dart';
import 'package:flutter_architecture/app/ui/modules/auth/login/login.view_model.dart';
import 'package:flutter_architecture/core/di/http_client.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  //Components
  inject.registerSingleton(HttpClient());

  //Remote Services
  inject.registerFactory(() => AuthService());
  inject.registerFactory(() => UserService());

  //Repositories
  inject.registerFactory(() => AuthRepository());

  //ViewModels
  inject.registerLazySingleton(() => LoginViewModel());
  inject.registerLazySingleton(() => HomeViewModel());
}