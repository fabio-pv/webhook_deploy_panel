import 'package:flutter/material.dart';

class SingInProvider extends InheritedWidget {
  final Function(Object form) doSingIn;
  final bool inLoad;

  SingInProvider({
    @required Widget child,
    @required this.doSingIn,
    this.inLoad,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static SingInProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SingInProvider>();
}
