import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/models/project.dart';

class ItemListProjectProvider extends InheritedWidget {
  final Project project;

  ItemListProjectProvider({
    @required Widget child,
    @required this.project,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ItemListProjectProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ItemListProjectProvider>();
}
