import 'package:flutter/material.dart';

class ProjectProvider extends InheritedWidget {
  final Function addProject;
  final Function(Object) doCreateProject;

  ProjectProvider({
    @required Widget child,
    this.doCreateProject,
    this.addProject,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ProjectProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ProjectProvider>();
}
