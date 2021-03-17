import 'package:flutter/material.dart';

class MenuButtonHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Icon(
        Icons.menu,
        color: Theme.of(context).accentColor,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(
        side: BorderSide(
          color: Theme.of(context).accentColor,
          width: 2,
        ),
      ),
    );
  }
}
