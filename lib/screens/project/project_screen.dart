import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/controllers/project_controller.dart';
import 'package:webhook_deploy_panel/providers/project_provider.dart';
import 'package:webhook_deploy_panel/screens/project/content_alert_project.dart';
import 'package:webhook_deploy_panel/screens/project/content_modal_project.dart';
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
  bool _openModal = false;
  bool _openAlertModal = false;
  Project _selectProject;

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

  void _addProject() {
    setState(() {
      this._openModal = !this._openModal;
      this._selectProject = null;
    });
  }

  Future<void> _doCreateProject(Object form) async {
    try {
      await this.projectController.doCreate(form);

      this._addProject();
      this._load();
    } catch (e) {
      rethrow;
    }
  }

  void _updateProject({Project project}) {
    setState(() {
      this._openModal = !this._openModal;
      this._selectProject = project;
    });
  }

  Future<void> _doUpdateProject(Object form, Project project) {
    try {} catch (e) {
      rethrow;
    }
  }

  void _deleteProject({Project project}) {
    setState(() {
      this._openAlertModal = !this._openAlertModal;
      this._selectProject = project;
    });
  }

  Future<void> _doDeleteProject() async {
    try {
      await this.projectController.doDelete(
            this._selectProject.uuid,
          );
      this._deleteProject();
      this._load();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProjectProvider(
      selectProject: this._selectProject,
      addProject: this._addProject,
      doCreateProject: this._doCreateProject,
      updateProject: this._updateProject,
      doUpdateProject: this._doUpdateProject,
      deleteProject: this._deleteProject,
      doDeleteProject: this._doDeleteProject,
      child: BaseScreenWidget(
        pageName: 'Projects',
        floatingActionButtonPress: this._addProject,
        openModal: this._openModal,
        contentModal: ContentModalProject(),
        openAlertModal: this._openAlertModal,
        contentAlerModal: ContentAlertProject(),
        body: Column(
          children: [
            ListProject(
              list: this._listProject,
            ),
          ],
        ),
      ),
    );
  }
}
