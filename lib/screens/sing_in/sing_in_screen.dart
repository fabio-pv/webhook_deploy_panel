import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/controllers/auth_controller.dart';
import 'package:webhook_deploy_panel/controllers/user_controller.dart';
import 'package:webhook_deploy_panel/providers/sing_in_provider.dart';
import 'package:webhook_deploy_panel/screens/sing_in/form_sing_in_screen.dart';
import 'package:webhook_deploy_panel/widgets/base_screen/base_screen_widget.dart';
import 'package:webhook_deploy_panel/widgets/card_default/card_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/sized_box_default/sized_box_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/sub_title_typography_default.dart';
import 'package:webhook_deploy_panel/widgets/typography_default/title_typography_default.dart';

class SingInScreen extends StatefulWidget {
  @override
  _SingInScreenState createState() => _SingInScreenState(
        authController: new AuthController(),
      );
}

class _SingInScreenState extends State<SingInScreen> {
  final AuthController authController;

  _SingInScreenState({
    @required this.authController,
  });

  Future<void> _doSingIn(Object form) async {
    try {
      this.authController.doLogin(form);
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingInProvider(
      doSingIn: this._doSingIn,
      child: BaseScreenWidget(
        body: Center(
          child: CardDefaultWidget(
            child: Container(
              width: 400,
              height: 350,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TitleTypographyDefault(
                    title: 'Webhook Deploy',
                  ),
                  SubTitleTypographyDefault(
                    title: 'Use your account to access',
                  ),
                  SizedBoxDefaultWidget(),
                  Expanded(
                    child: Container(),
                  ),
                  FormSingInScreen(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
