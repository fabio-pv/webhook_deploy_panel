import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/base_screen_provider.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/header_title_typography_default.dart';

class TitleHeaderWidget extends StatelessWidget {
  BuildContext _contextAux;

  List<Widget> _make() {
    List<Widget> widgets = [];

    BaseScreenProvider.of(this._contextAux).pageName.forEach((element) {
      widgets.add(HeaderSubTitleTypographyDefault(
        title: element,
      ));
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    this._contextAux = context;

    return Container(
      child: Row(
        children: this._make(),
      ),
    );
  }
}
