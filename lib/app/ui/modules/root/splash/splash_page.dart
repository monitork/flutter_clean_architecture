import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/services/auth_service.dart';
import 'package:flutter_architecture/app/services/navigation_service.dart';
import 'package:flutter_architecture/app/ui/components/loading.dart';
import 'package:flutter_architecture/app/ui/modules/auth/login/login_view_model.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final authState = inject<AuthService>();
  final vm = inject<LoginViewModel>();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => tryLogin(context));
    super.initState();
  }

  Future<void> tryLogin(BuildContext context) async {
    await vm.tryLogin();
    if (authState.currentUser != null) {
      inject<NavigationService>().pushNamed('/home');
      // Navigator.of(context).pushNamed('/home');
    } else {
      // Navigator.of(context).pushNamed('/login');
      inject<NavigationService>().pushNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: vm.loading,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return LoadingWidget(
            status: snapshot.data != null && snapshot.data,
            child: const Scaffold(
                body: Center(
              child: TextWidget(text: "Hahah..."),
            )));
      },
    );
  }
}
