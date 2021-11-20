import 'package:flutter_architecture/app/ui/modules/auth/login/login_bloc.dart';
import 'package:flutter_architecture/app/ui/modules/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

class InjectorBlocs {
  static Future setup(GetIt inject) async {
    inject.registerLazySingleton(() => LoginBloc(inject()));
    inject.registerLazySingleton(() => HomeBloc());
  }
}
