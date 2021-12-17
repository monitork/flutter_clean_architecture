import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/core/di/injector_app.dart';
import 'base_bloc.dart';

abstract class BaseState<P extends StatefulWidget, B extends BaseBloc>
    extends State<P> {
  B bloc = inject.get<B>();

  @override
  void initState() {
    bloc.onInit();
    super.initState();
  }
}
