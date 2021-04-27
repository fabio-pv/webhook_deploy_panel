import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/models/project.dart';

class ProjectProvider extends InheritedWidget {
  final Project selectProject;
  final Function addProject;
  final Function(Object) doCreateProject;
  final Function({Project project}) updateProject;
  final Function(Object, Project) doUpdateProject;
  final Function({Project project}) deleteProject;
  final Function doDeleteProject;

  ProjectProvider({
    @required Widget child,
    this.selectProject,
    this.doCreateProject,
    this.addProject,
    this.deleteProject,
    this.doDeleteProject,
    this.updateProject,
    this.doUpdateProject,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ProjectProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ProjectProvider>();
}
