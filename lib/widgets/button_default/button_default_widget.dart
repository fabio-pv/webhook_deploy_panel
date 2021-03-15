import 'package:flutter/material.dart';

class ButtonDefaultWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonDefaultWidget({
    @required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: OutlinedButton(
        child: Text(this.text.toUpperCase()),
        onPressed: this.onPressed,
        style: OutlinedButton.styleFrom(
          primary: Theme.of(context).accentColor,
          padding: EdgeInsets.all(20.0),
          side: BorderSide(
            color: Theme.of(context).accentColor,
            width: 2,
          ),
          /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),*/
        ),
      ),
    );
  }
}
