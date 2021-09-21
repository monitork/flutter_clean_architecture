import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/components/loading.dart';
import 'login.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: vm.loading,
        builder: (context, snapshot) {
          return LoadingWidget(
              message: "Loading message",
              status: snapshot.data ?? false,
              child: SafeArea(
                child: Scaffold(
                    key: _scaffoldKey,
                    body: SingleChildScrollView(
                      child: Container(child: form(context, _scaffoldKey)),
                    )),
              ));
        });
  }
}
