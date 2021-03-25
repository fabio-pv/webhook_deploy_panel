import 'package:flutter/material.dart';

class BaseScreenProvider extends InheritedWidget {
  final String pageName;
  final bool openModal;
  final Widget contentModal;
  final bool openAlertModal;
  final Widget contentAlertModal;

  BaseScreenProvider({
    @required Widget child,
    @required this.pageName,
    @required this.openModal,
    @required this.contentModal,
    @required this.openAlertModal,
    @required this.contentAlertModal,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static BaseScreenProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BaseScreenProvider>();
}
