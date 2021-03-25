import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/button_default/button_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/flat_button_default/flat_button_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/sub_title_typography_default.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/title_typography_default.dart';

class SimpleModalWidget extends StatelessWidget {
  final List<Widget> child;

  SimpleModalWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 400,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleTypographyDefault(
                title: 'Create',
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(
                  Icons.close_outlined,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              children: this.child,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                child: FlatButtonDefaultWidget(
                  text: 'Cancel',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                child: ButtonDefaultWidget(
                  text: 'Save',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
