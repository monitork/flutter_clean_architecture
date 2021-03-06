import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/services/navigation_service.dart';
import 'package:flutter_architecture/app/ui/modules/home/home_page.dart';
import 'package:flutter_architecture/app/ui/routers.dart';
import 'package:flutter_architecture/app/ui/widgets/button.dart';
import 'package:flutter_architecture/app/ui/widgets/input.dart';
import 'package:flutter_architecture/app/ui/widgets/logo.dart';
import 'package:flutter_architecture/app/ui/widgets/snack_bar.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';
import 'package:flutter_architecture/core/di/injector_app.dart';
import 'package:flutter_architecture/device/nav/nav_slide_from_top.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;
import 'login_bloc.dart';

class LoginWidget {
  Widget form(BuildContext context, LoginBloc _bloc) {
    return Padding(
      padding: const EdgeInsets.all(dimens.margin),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const LogoWidget(),
            const SizedBox(height: 20),
            StreamBuilder<String>(
                stream: _bloc.login,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  return InputWidget(
                    placeholder: "LOGIN",
                    capitalization: TextCapitalization.sentences,
                    // Ký tự đầu tiên sẽ viết hoa
                    value: snapshot.data,
                    errorMessage: snapshot.error?.toString(),
                    onChange: (value) => _bloc.setLogin(value),
                    // onChange: (value) => vm.updateEmail(value),
                  );
                }),
            const SizedBox(height: 10),
            StreamBuilder<String>(
                stream: _bloc.password,
                builder: (context, snapshot) {
                  return InputWidget(
                    placeholder: "PASSWORD",
                    value: snapshot.data,
                    errorMessage: snapshot.error?.toString(),
                    onChange: (value) => _bloc.setPassword(value),
                    // onChange: (value) => vm.updatePassword(value),
                  );
                }),
            const SizedBox(height: 20),
            Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: () => print("forgot password click"),
                    child: const TextWidget(
                        text: "Forgot a password", small: true))),
            const SizedBox(height: 12),
            StreamBuilder<bool>(
                stream: _bloc.submitValid,
                builder: (context, snapshot) {
                  return ButtonWidget(
                      label: "login",
                      disabled: snapshot.data == null || !snapshot.data!,
                      onPress: () async {
                        final ret = await _bloc.signIn();
                        if (ret) {
                          SnackBarWidget(message: "SUCCESS");
                        } else {
                          SnackBarWidget(
                              error: true,
                              message: "NOT FOUND",
                              actionMessage: "OK", action: () {
                            print("ACTION CLICKED");
                          });
                        }

                        await Future.delayed(const Duration(seconds: 1));
                        if (ret) {
                          Navigator.pushReplacement(
                              context, NavSlideFromTop(page: const HomePage()));
                        }
                      });
                }),
            const SizedBox(height: 12),
            ButtonWidget(
                label: "register",
                transparent: true,
                onPress: () async {
                  final ret = await _bloc.signIn();

                  if (ret) {
                    SnackBarWidget( message: "SUCCESS");
                  } else {
                    SnackBarWidget(
                        error: true,
                        message: "NOT FOUND",
                        actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
                  }
                  inject<NavigationService>()
                      .pushNamedAndRemoveUntil(Routes.home);
                  // Navigator.pushReplacement(
                  //     context, NavSlideFromTop(page: const HomePage()));
                }),
            const SizedBox(height: 12),
            ButtonWidget(
                facebook: true,
                label: "Login facebook",
                onPress: () async {
                  final ret = await _bloc.signIn();

                  if (ret) {
                    SnackBarWidget( message: "SUCCESS");
                  } else {
                    SnackBarWidget(
                        error: true,
                        message: "NOT FOUND",
                        actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
                  }
                  inject<NavigationService>()
                      .pushNamedAndRemoveUntil(Routes.home);
                })
          ],
        ),
      ),
    );
  }
}
