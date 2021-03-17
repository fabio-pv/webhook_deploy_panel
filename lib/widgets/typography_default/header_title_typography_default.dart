import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/super_provider.dart';

class HeaderSubTitleTypographyDefault extends StatelessWidget {
  final String title;

  HeaderSubTitleTypographyDefault({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: Theme.of(context).textTheme.headline6.copyWith(
            color: SuperProvider.of(context).subTitleColor,
          ),
    );
  }
}
