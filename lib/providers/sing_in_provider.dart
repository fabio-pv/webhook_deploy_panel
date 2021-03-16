import 'package:flutter/material.dart';

class SingInProvider extends InheritedWidget {
  final Function(Object form) doSingIn;

  SingInProvider({
    @required Widget child,
    @required this.doSingIn,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static SingInProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SingInProvider>();
}
