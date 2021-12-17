import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/widgets/loading.dart';
import 'package:flutter_architecture/core/base/bloc_provider.dart';
import 'login_bloc.dart';
import 'login_widget.dart';

class LoginPage extends StatelessWidget with LoginWidget {
  final LoginBloc bloc;

  LoginPage({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(child: _buildBody(), bloc: bloc);
  }

  _buildBody() {
    return StreamBuilder<bool>(
        stream: bloc.loading,
        builder: (context, snapshot) {
          return LoadingWidget(
              message: "Loading message",
              status: snapshot.data ?? false,
              child: SafeArea(
                child: Scaffold(
                    body: SingleChildScrollView(
                  child: Container(child: form(context, bloc)),
                )),
              ));
        });
  }
}
