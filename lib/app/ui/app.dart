import 'package:flutter/material.dart';
import 'routers.dart';
import 'package:flutter_architecture/core/values/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routes: Routes.routes,
        initialRoute: '/',
      );
}
