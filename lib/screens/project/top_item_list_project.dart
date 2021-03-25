import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/models/project.dart';
import 'package:webhook_deploy_panel/providers/item_list_project_provider.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/sub_title_typography_default.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/title_typography_default.dart';

class TopItemListProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Project project = ItemListProjectProvider.of(context).project;

    return Container(
      child: Column(
        children: [
          TitleTypographyDefault(
            title: project.name,
          ),
          SubTitleTypographyDefault(
            title: project.directory,
          ),
        ],
      ),
    );
  }
}
