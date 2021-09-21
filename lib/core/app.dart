import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/modules/auth/login/login.page.dart';
import 'package:flutter_architecture/core/values/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const LoginPage()
  );
}