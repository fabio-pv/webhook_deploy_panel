import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/screens/project/item_list_project.dart';

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
