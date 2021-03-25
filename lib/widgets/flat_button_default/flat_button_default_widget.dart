import 'package:flutter/material.dart';

class FlatButtonDefaultWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool inLoad;

  FlatButtonDefaultWidget({
    @required this.text,
    this.onPressed,
    this.inLoad = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (!this.inLoad ? double.maxFinite : null),
      child: (() {
        if (this.inLoad) {
          return (CircularProgressIndicator());
        }
        return (OutlinedButton(
          child: Text(
            this.text.toUpperCase(),
          ),
          onPressed: this.onPressed,
          style: OutlinedButton.styleFrom(
            primary: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20.0),
            side: BorderSide(
              color: Theme.of(context).primaryColorDark,
              width: 2,
            ),
          ),
        ));
      }()),
    );
  }
}
