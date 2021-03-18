import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/base_screen_provider.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/header_title_typography_default.dart';

class TitleHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HeaderSubTitleTypographyDefault(
        title: BaseScreenProvider.of(context).pageName,
      ),
    );
  }
}
