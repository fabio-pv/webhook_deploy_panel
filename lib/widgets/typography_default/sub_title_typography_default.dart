import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/super_provider.dart';

class SubTitleTypographyDefault extends StatelessWidget {
  final String title;

  SubTitleTypographyDefault({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: SuperProvider.of(context).subTitleColor,
          ),
    );
  }
}
