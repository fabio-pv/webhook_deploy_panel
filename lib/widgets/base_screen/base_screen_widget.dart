import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/header/header_widget.dart';

class BaseScreenWidget extends StatelessWidget {
  final Widget body;

  BaseScreenWidget({
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HeaderWidget(
          child: this.body,
        ),
      ),
    );
  }
}
