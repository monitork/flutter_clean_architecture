import 'package:flutter/material.dart';

import 'bloc_base.dart';

class BlocProvider1<T extends BlocBase> extends InheritedWidget {
  final T bloc;

  const BlocProvider1({
    Key? key,
    required this.bloc,
    required Widget child,
  }) : super(key: key, child: child);

  // static Type _typeOf<T>() => T;

  static T of<T extends BlocBase>(BuildContext context) {
    // final type = _typeOf<BlocProvider<T>>();
    final provider =
        context.dependOnInheritedWidgetOfExactType<BlocProvider1<T>>()
            as BlocProvider1<T>;
    print("provider: $provider");
    return provider.bloc;
  }

  @override
  bool updateShouldNotify(BlocProvider1 oldWidget) => false;
}
