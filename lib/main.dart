import 'package:flutter/material.dart';
import 'core/app.dart';
import 'core/di/injector_provider.dart';

void main() {
  setupInjection();
  runApp(const App());
}

