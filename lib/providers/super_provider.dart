import 'package:flutter/material.dart';

class SuperProvider extends InheritedWidget {
  final Color subTitleColor;

  SuperProvider({
    @required Widget child,
    @required this.subTitleColor,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static SuperProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SuperProvider>();
}
