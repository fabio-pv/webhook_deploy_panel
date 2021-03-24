import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/controllers/project_controller.dart';
import 'package:webhook_deploy_panel/screens/project/list_project.dart';
import 'package:webhook_deploy_panel/widgets/base_screen/base_screen_widget.dart';

import '../../models/project.dart';

class ProjectScreen extends StatefulWidget {
  static const ROUTE = '/projects';

  @override
  _ProjectScreenState createState() => _ProjectScreenState(
        projectController: new ProjectController(),
      );
}

class _ProjectScreenState extends State<ProjectScreen> {
  final ProjectController projectController;

  _ProjectScreenState({
    @required this.projectController,
  });

  List<Project> _listProject = [];

  @override
  void initState() {
    this._load();
    super.initState();
  }

  Future<void> _load() async {
    try {
      final listProject = await this.projectController.getList();

      setState(() {
        this._listProject = listProject;
      });
    } catch (e) {
      rethrow;
    }
  }

  void _addProject() async {}

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      pageName: 'Projects',
      floatingActionButtonPress: this._addProject,
      body: Column(
        children: [
          ListProject(
            list: this._listProject,
          ),
        ],
      ),
    );
  }
}
