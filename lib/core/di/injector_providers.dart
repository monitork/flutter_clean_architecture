import 'package:flutter_architecture/app/data/remote/auth.provider.dart';
import 'package:flutter_architecture/app/data/remote/user.provider.dart';
import 'package:get_it/get_it.dart';

class InjectorProviders {
  static Future setup(GetIt inject) async {

  //Remote Services
    inject.registerFactory(() => AuthProvider(inject(),inject()));
    inject.registerFactory(() => UserProvider(inject()));
  }
}