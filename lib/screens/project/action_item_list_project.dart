import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/item_list_project_provider.dart';
import 'package:webhook_deploy_panel/providers/project_provider.dart';
import 'package:webhook_deploy_panel/widgets/icon_button_small_default/icon_button_small_default_widget.dart';

class ActionItemListProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectProvider = ProjectProvider.of(context);
    final itemListProjectProvider = ItemListProjectProvider.of(context);

    return Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButtonSmallDefaultWidget(
            tooltip: 'Repositories',
            onPressed: () {},
            icon: Icons.code,
          ),
          IconButtonSmallDefaultWidget(
            tooltip: 'Edit',
            onPressed: () => projectProvider.updateProject(
              project: itemListProjectProvider.project,
            ),
            icon: Icons.edit,
          ),
          IconButtonSmallDefaultWidget(
            tooltip: 'Delete',
            onPressed: () => projectProvider.deleteProject(
              project: itemListProjectProvider.project,
            ),
            icon: Icons.delete,
          ),
        ],
      ),
    );
  }
}
