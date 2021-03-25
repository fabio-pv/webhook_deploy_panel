import 'dart:convert';

import 'package:webhook_deploy_panel/models/project.dart';
import 'package:webhook_deploy_panel/services/project_service.dart';

import '../models/project.dart';
import '../models/project.dart';
import '../models/project.dart';
import '../models/project.dart';
import '../models/project.dart';
import '../models/project.dart';
import '../models/project.dart';
import '../models/project.dart';

class ProjectController {
  ProjectService _projectService;

  ProjectController() {
    this._projectService = new ProjectService();
  }

  Future<List<Project>> getList() async {
    try {
      final response = await this._projectService.get();

      List<Project> list = (response['data'] as List).map((item) {
        return Project.fromJson(item);
      }).toList();

      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<Project> doCreate(Object form) async {
    try {
      final response = await this._projectService.post(
            data: form,
          );

      Project project = Project.fromJson(response);

      return project;
    } catch (e) {
      rethrow;
    }
  }
}
