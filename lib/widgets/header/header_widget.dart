import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/header/menu_button_header_widget.dart';
import 'package:webhook_deploy_panel/widgets/header/title_header_widget.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
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
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(100);
}
