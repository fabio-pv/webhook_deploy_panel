import 'package:flutter/material.dart';

class TitleTypographyDefault extends StatelessWidget {
  final String title;

  TitleTypographyDefault({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: Theme.of(context).textTheme.headline5.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }
}
