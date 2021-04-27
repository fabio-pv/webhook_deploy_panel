import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:webhook_deploy_panel/providers/base_screen_provider.dart';
import 'package:webhook_deploy_panel/widgets/base_screen/modal/alert_base_screen_widget.dart';
import 'package:webhook_deploy_panel/widgets/base_screen/modal/modal_base_screen_widget.dart';
import 'package:webhook_deploy_panel/widgets/header/header_widget.dart';

import '../header/menu_button_header_widget.dart';
import '../header/title_header_widget.dart';

class BaseScreenWidget extends StatelessWidget {
  static const defaultPaddingBody = EdgeInsets.only(
    left: 100.0,
    right: 100.0,
  );

  final Widget body;
  final List<String> pageName;
  final EdgeInsets paddingBody;
  final bool removeAppbar;
  final Function floatingActionButtonPress;
  final String tooltipFloatingActionButtonPress;
  final bool openModal;
  final Widget contentModal;
  final bool openAlertModal;
  final Widget contentAlerModal;

  BaseScreenWidget({
    @required this.body,
    this.pageName,
    this.paddingBody = defaultPaddingBody,
    this.removeAppbar = false,
    this.floatingActionButtonPress,
    this.tooltipFloatingActionButtonPress,
    this.openModal = false,
    this.contentModal,
    this.openAlertModal = false,
    this.contentAlerModal,
  });

  BuildContext _contextAux;

  _getAppBar() {
    if (this.removeAppbar) {
      return null;
    }

    return HeaderWidget();
  }

  _getBody() {
    return Stack(
      children: [
        Container(
          padding: this.paddingBody,
          child: this.body,
        ),
        ModalBaseScreenWidget(),
        AlertBaseScreenWidget(),
      ],
    );
  }

  _getFloatingActionButton() {
    if (this.floatingActionButtonPress == null) {
      return null;
    }

    return FloatingActionButton(
      onPressed: this.floatingActionButtonPress,
      backgroundColor: Theme.of(this._contextAux).backgroundColor,
      elevation: 0,
      tooltip: this.tooltipFloatingActionButtonPress ?? 'Create',
      shape: CircleBorder(
        side: BorderSide(
          color: Theme.of(this._contextAux).accentColor,
          width: 2,
        ),
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(this._contextAux).accentColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this._contextAux = context;
    return BaseScreenProvider(
      pageName: this.pageName,
      openModal: this.openModal,
      contentModal: this.contentModal,
      openAlertModal: this.openAlertModal,
      contentAlertModal: this.contentAlerModal,
      child: SafeArea(
        child: Scaffold(
          appBar: this._getAppBar(),
          body: this._getBody(),
          floatingActionButton: this._getFloatingActionButton(),
        ),
      ),
    );
  }
}
