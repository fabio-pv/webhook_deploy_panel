import 'package:flutter/material.dart';

class SubTitleTypographyDefault extends StatelessWidget {
  final String title;

  SubTitleTypographyDefault({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Theme.of(context).accentColor,
          ),
    );
  }
}
