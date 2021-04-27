import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/widgets/button_default/button_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/flat_button_default/flat_button_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/title_typography_default.dart';

class SimpleModalWidget extends StatelessWidget {
  final List<Widget> child;
  final Function closeModal;
  final Function onPressSave;
  final Function onPressCancel;
  final Object objectUpdate;

  SimpleModalWidget({
    @required this.child,
    this.closeModal,
    this.onPressSave,
    this.onPressCancel,
    this.objectUpdate,
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
                onPressed: this.closeModal,
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
                  onPressed: this.onPressCancel,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              if (this.objectUpdate == null) ...[
                Container(
                  width: 100,
                  child: ButtonDefaultWidget(
                    text: 'Save',
                    onPressed: () => this.onPressSave(),
                  ),
                ),
              ],
              if (this.objectUpdate != null) ...[
                Container(
                  width: 100,
                  child: ButtonDefaultWidget(
                    text: 'Update',
                    onPressed: () => this.onPressSave(
                      update: true,
                      object: this.objectUpdate,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
