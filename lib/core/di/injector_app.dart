import 'package:dio/dio.dart';
import 'package:flutter_architecture/app/data/cache/storage.helper.dart';
import 'package:flutter_architecture/core/di/injector_services.dart';
import 'package:get_it/get_it.dart';

import 'http_client.dart';
import 'injector_blocs.dart';
import 'injector_page.dart';
import 'injector_providers.dart';
import 'injector_repositories.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  //Components
  inject.registerSingleton(StorageHelper());
  inject.registerSingleton(Dio());
  inject.registerSingleton(HttpClient(inject(), inject()));
  //Remote Services
  await InjectorProviders.setup(inject);
  //Repositories
  await InjectorRepositories.setup(inject);
  // Services
  await InjectorServices.setup(inject);
  //Bloc
  await InjectorBlocs.setup(inject);
  // Page
  await InjectorPage.setup(inject);
}
