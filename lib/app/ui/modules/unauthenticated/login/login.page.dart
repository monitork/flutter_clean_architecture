import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/components/loading.dart';
import 'package:flutter_architecture/app/ui/modules/unauthenticated/login/login.bloc.dart';
// import 'package:flutter_architecture/core/base/bloc_provider.dart';
import 'package:flutter_architecture/core/base/provider.dart';
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
    final bloc = BlocProvider1.of<LoginBloc>(context);
    return StreamBuilder<bool>(
        stream: bloc.loading,
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
