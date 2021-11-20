import 'package:flutter/material.dart';

import 'base_bloc.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  const BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T? of<T extends BaseBloc>(BuildContext context) {
    BlocProvider<T>? provider = context.findAncestorWidgetOfExactType();
    return provider?.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
