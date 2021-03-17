import 'package:flutter/material.dart';

class ButtonDefaultWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool inLoad;

  ButtonDefaultWidget({
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
          return (CircularProgressIndicator(
            color: Theme.of(context).accentColor,
          ));
        }
        return (OutlinedButton(
          child: Text(
            this.text.toUpperCase(),
          ),
          onPressed: this.onPressed,
          style: OutlinedButton.styleFrom(
            primary: Theme
                .of(context)
                .accentColor,
            padding: EdgeInsets.all(20.0),
            side: BorderSide(
              color: Theme
                  .of(context)
                  .accentColor,
              width: 2,
            ),
          ),
        ));
      }()),
    );
  }
}
