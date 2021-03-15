import 'package:flutter/material.dart';

class CardDefaultWidget extends StatelessWidget {
  final Widget child;

  CardDefaultWidget({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      child: this.child,
    );
  }
}
