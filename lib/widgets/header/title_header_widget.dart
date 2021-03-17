import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/header_title_typography_default.dart';

class TitleHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HeaderSubTitleTypographyDefault(
        title: 'Home',
      ),
    );
  }
}
