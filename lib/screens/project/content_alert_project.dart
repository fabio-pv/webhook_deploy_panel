import 'dart:html';

import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/project_provider.dart';
import 'package:webhook_deploy_panel/widgets/alert/simple_alert_widget.dart';

class ContentAlertProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectProvider = ProjectProvider.of(context);

    return SimpleAlertWidget(
      title: 'Delete',
      subTitle: 'Do you want to remove the project?',
      closeModal: projectProvider.deleteProject,
      onPressCancel: projectProvider.deleteProject,
      onPressSave: () {
        projectProvider.doDeleteProject('1234');
      },
    );
  }
}
