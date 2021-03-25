import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/screens/project/item_list_project.dart';
import 'package:webhook_deploy_panel/widgets/button_default/button_default_widget.dart';

import '../../models/project.dart';

class ListProject extends StatelessWidget {
  final List<Project> list;

  ListProject({
    @required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 1,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: this.list.length,
          padding: EdgeInsets.only(
            top: 100,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2.0,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0
          ),
          itemBuilder: (BuildContext context, int index) {
            return ItemListProject(
              project: this.list[index],
            );
          },
        ),
      ),
    );
  }
}
