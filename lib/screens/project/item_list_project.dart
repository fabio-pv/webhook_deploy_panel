import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/item_list_project_provider.dart';
import 'package:webhook_deploy_panel/screens/project/action_item_list_project.dart';
import 'package:webhook_deploy_panel/screens/project/top_item_list_project.dart';
import 'package:webhook_deploy_panel/widgets/card_default/card_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/sub_title_typography_default.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/title_typography_default.dart';

import '../../models/project.dart';

class ItemListProject extends StatelessWidget {
  final Project project;

  ItemListProject({
    @required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return ItemListProjectProvider(
      project: this.project,
      child: CardDefaultWidget(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopItemListProject(),
              ActionItemListProject(),
            ],
          ),
        ),
      ),
    );
  }
}
