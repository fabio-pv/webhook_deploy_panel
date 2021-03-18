import 'package:flutter/material.dart';

class BaseScreenProvider extends InheritedWidget {
  final String pageName;

  BaseScreenProvider({
    @required Widget child,
    @required this.pageName,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static BaseScreenProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BaseScreenProvider>();
}
