import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/header/menu_button_header_widget.dart';
import 'package:webhook_deploy_panel/widgets/header/title_header_widget.dart';

class HeaderWidget extends StatelessWidget {
  final Widget child;

  HeaderWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
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
        this.child,
      ],
    );
  }
}
