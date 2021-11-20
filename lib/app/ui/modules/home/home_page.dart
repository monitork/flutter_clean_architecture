import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/services/auth_service.dart';
import 'package:flutter_architecture/app/services/navigation_service.dart';
import 'package:flutter_architecture/app/ui/modules/auth/login/login_page.dart';
import 'package:flutter_architecture/app/ui/widgets/button.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';
import 'package:flutter_architecture/core/di/injector_app.dart';

import 'package:flutter_architecture/core/values/dimens.dart' as dimens;
import 'package:flutter_architecture/device/nav/nav_slide_from_left.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final vm = inject<HomeBloc>();
  final authState = inject<AuthService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextWidget(text: "Home Page"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    text: "Name:",
                  ),
                  TextWidget(
                    text: authState.currentUser?.name,
                  ),
                ],
              ),
              const SizedBox(height: dimens.fieldSpace),
              ButtonWidget(
                label: "Logout",
                onPress: () {
                  inject<NavigationService>().pushReplacementNamed('/login');
                  // Navigator.pushReplacement(
                  //     context, NavSlideFromLeft(page: const LoginPage()))
                },
              ),
              ButtonWidget(
                  label: "Go to Profile",
                  onPress: () {
                    inject<NavigationService>().pushNamed('/profile');
                    // Navigator.of(context).pushNamed('/profile')
                  })
            ],
          ),
        ),
      ),
    );
  }
}
