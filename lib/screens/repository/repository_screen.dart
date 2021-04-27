import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/base_screen/base_screen_widget.dart';

class RepositoryScreen extends StatelessWidget {
  static const ROUTE = '/repositories';

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      pageName: 'Repositories',
      body: Container(),
    );
  }
}
