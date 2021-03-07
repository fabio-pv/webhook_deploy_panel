import 'package:flutter/material.dart';

class BaseScreenWidget extends StatelessWidget {
  final Widget body;

  BaseScreenWidget({
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.body,
    );
  }
}
