import 'package:flutter/material.dart';

import '../../models/project.dart';

class ItemListProject extends StatelessWidget {
  final Project project;

  ItemListProject({
    @required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.project.name),
    );
  }
}
