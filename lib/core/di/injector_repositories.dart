import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:get_it/get_it.dart';

class InjectorRepositories{
  static Future setup(GetIt inject) async {
    inject.registerFactory(() => AuthRepository(inject()));
  }
}