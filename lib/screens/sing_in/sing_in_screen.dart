import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/base_screen/base_screen_widget.dart';

class SingInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScreenWidget(
        body: Container(
          child: Center(
            child: SelectableText('In Development'),
          ),
        ),
      ),
    );
  }
}
