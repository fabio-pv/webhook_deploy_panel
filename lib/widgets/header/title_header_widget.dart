import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/base_screen_provider.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/header_title_typography_default.dart';

class TitleHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageName = BaseScreenProvider.of(context).pageName;

    return ListView.separated(
      shrinkWrap: true,
      itemCount: pageName.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, int) {
        return Center(
          child: HeaderSubTitleTypographyDefault(
            title: pageName[int],
          ),
        );
      },
      separatorBuilder: (context, int) {
        return Center(
          child: Icon(
            Icons.chevron_right,
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }
}
