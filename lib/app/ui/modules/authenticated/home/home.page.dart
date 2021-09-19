import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/modules/unauthenticated/login/login.page.dart';
import 'package:flutter_architecture/app/ui/widgets/button.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';

import 'package:flutter_architecture/core/values/dimens.dart' as dimens;
import 'package:flutter_architecture/device/nav/nav_slide_from_left.dart';
import 'home.view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final vm = inject<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextWidget(text: "Home Page"),
              const SizedBox(height: dimens.fieldSpace),
              ButtonWidget(
                label: "Go to Login Page ",
                onPress: () => Navigator.pushReplacement(
                    context, NavSlideFromLeft(page: const LoginPage())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
