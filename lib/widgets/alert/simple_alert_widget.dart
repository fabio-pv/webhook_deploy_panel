import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/button_default/button_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/flat_button_default/flat_button_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/sub_title_typography_default.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/title_typography_default.dart';

class SimpleAlertWidget extends StatelessWidget {
  final List<Widget> child;
  final Function closeModal;
  final Function onPressSave;
  final Function onPressCancel;
  final String title;
  final String subTitle;
  final String onPressSaveText;
  final String onPressCancelText;

  SimpleAlertWidget({
    @required this.title,
    @required this.subTitle,
    this.child,
    this.closeModal,
    this.onPressSave,
    this.onPressCancel,
    this.onPressSaveText = 'Yes',
    this.onPressCancelText = 'No',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 200,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTypographyDefault(
                    title: this.title,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                      Icons.close_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: this.closeModal,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SubTitleTypographyDefault(
                      title: this.subTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                child: FlatButtonDefaultWidget(
                  text: this.onPressCancelText,
                  onPressed: this.onPressCancel,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                child: ButtonDefaultWidget(
                  text: this.onPressSaveText,
                  onPressed: this.onPressSave,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
