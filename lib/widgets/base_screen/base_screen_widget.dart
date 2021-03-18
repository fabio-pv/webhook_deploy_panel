import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/base_screen_provider.dart';
import 'package:webhook_deploy_panel/widgets/header/header_widget.dart';

import '../header/menu_button_header_widget.dart';
import '../header/title_header_widget.dart';

class BaseScreenWidget extends StatelessWidget {
  final Widget body;
  final String pageName;

  BaseScreenWidget({
    @required this.body,
    this.pageName = '???',
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreenProvider(
      pageName: this.pageName,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Container(
              width: double.maxFinite,
              height: 80,
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MenuButtonHeaderWidget(),
                  TitleHeaderWidget(),
                ],
              ),
            ),
          ),
          body: this.body,
        ),
      ),
    );
  }
}
