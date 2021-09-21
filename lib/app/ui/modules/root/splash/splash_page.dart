import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/components/loading.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const LoadingWidget(child: Text("Hahah..."),);
  }
}
