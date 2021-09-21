import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/modules/home/home.page.dart';
import 'package:flutter_architecture/app/ui/widgets/button.dart';
import 'package:flutter_architecture/app/ui/widgets/input.dart';
import 'package:flutter_architecture/app/ui/widgets/logo.dart';
import 'package:flutter_architecture/app/ui/widgets/snack_bar.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
import 'package:flutter_architecture/device/nav/nav_slide_from_top.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;
import 'login.view_model.dart';

class LoginWidget {
  final vm = inject<LoginViewModel>();

  Widget form(BuildContext context, GlobalKey<ScaffoldState> key) {
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
                stream: vm.login,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  return InputWidget(
                    placeholder: "LOGIN",
                    capitalization: TextCapitalization.sentences,
                    // Ký tự đầu tiên sẽ viết hoa
                    value: snapshot.data,
                    errorMessage: snapshot.error?.toString(),
                    onChange: (value) => vm.setLogin(value),
                    // onChange: (value) => vm.updateEmail(value),
                  );
                }),
            const SizedBox(height: 10),
            StreamBuilder<String>(
                stream: vm.password,
                builder: (context, snapshot) {
                  return InputWidget(
                    placeholder: "SENHA",
                    value: snapshot.data,
                    errorMessage: snapshot.error?.toString(),
                    onChange: (value) => vm.setPassword(value),
                    // onChange: (value) => vm.updatePassword(value),
                  );
                }),
            const SizedBox(height: 20),
            Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: () => print("forgot password click"),
                    child: const TextWidget(
                        text: "Esqueci a senha", small: true))),
            const SizedBox(height: 12),
            StreamBuilder<bool>(
                stream: vm.submitValid,
                builder: (context, snapshot) {
                  return ButtonWidget(
                      label: "login",
                      disabled: snapshot.data == null || !snapshot.data!,
                      onPress: () async {
                        final ret = await vm.signIn();
                        if (ret) {
                          SnackBarWidget(key, message: "SUCCESS");
                        } else {
                          SnackBarWidget(key,
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
                label: "cadastrar",
                transparent: true,
                onPress: () async {
                  final ret = await vm.signIn();

                  if (ret) {
                    SnackBarWidget(key, message: "SUCCESS");
                  } else {
                    SnackBarWidget(key,
                        error: true,
                        message: "NOT FOUND",
                        actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
                  }

                  Navigator.pushReplacement(
                      context, NavSlideFromTop(page: const HomePage()));
                }),
            const SizedBox(height: 12),
            ButtonWidget(
                facebook: true,
                label: "entrar com facebook",
                onPress: () async {
                  final ret = await vm.signIn();

                  if (ret) {
                    SnackBarWidget(key, message: "SUCCESS");
                  } else {
                    SnackBarWidget(key,
                        error: true,
                        message: "NOT FOUND",
                        actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
                  }

                  Navigator.pushReplacement(
                      context, NavSlideFromTop(page: const HomePage()));
                })
          ],
        ),
      ),
    );
  }
}
