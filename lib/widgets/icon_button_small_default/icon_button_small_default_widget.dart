import 'package:flutter/material.dart';

class IconButtonSmallDefaultWidget extends StatelessWidget {
  final String tooltip;
  final Function onPressed;
  final IconData icon;

  IconButtonSmallDefaultWidget({
    @required this.tooltip,
    @required this.onPressed,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 18,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      constraints: BoxConstraints(),
      tooltip: this.tooltip,
      icon: Icon(
        this.icon,
        color: Theme.of(context).accentColor,
      ),
      onPressed: this.onPressed,
    );
  }
}
