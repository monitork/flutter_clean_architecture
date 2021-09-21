import 'package:flutter/material.dart';
import 'app/ui/app.dart';
import 'core/di/injector_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  runApp(const App());
}

