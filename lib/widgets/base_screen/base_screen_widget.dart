import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:webhook_deploy_panel/providers/base_screen_provider.dart';
import 'package:webhook_deploy_panel/widgets/header/header_widget.dart';

import '../header/menu_button_header_widget.dart';
import '../header/title_header_widget.dart';

class BaseScreenWidget extends StatelessWidget {
  static const defaultPaddingBody = EdgeInsets.only(
    left: 40.0,
    right: 40.0,
  );

  final Widget body;
  final String pageName;
  final EdgeInsets paddingBody;

  BaseScreenWidget({
    @required this.body,
    this.pageName = '???',
    this.paddingBody = defaultPaddingBody,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreenProvider(
      pageName: this.pageName,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Container(
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
          body: Container(
            padding: this.paddingBody,
            child: this.body,
          ),
        ),
      ),
    );
  }
}
