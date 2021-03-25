import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:webhook_deploy_panel/providers/sing_in_provider.dart';
import 'package:webhook_deploy_panel/widgets/button_default/button_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/form_default/form_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/text_field_default/text_field_default_widget.dart';

class FormSingInScreen extends StatefulWidget {
  @override
  _FormSingInScreenState createState() => _FormSingInScreenState();
}

class _FormSingInScreenState extends State<FormSingInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void validateForm() {
    final form = this._formKey.currentState;
    if (!form.saveAndValidate()) {
      return;
    }

    SingInProvider.of(context).doSingIn(form.value);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: this._formKey,
      child: Column(
        children: [
          TextFieldDefaultWidget(
            name: 'email',
            label: 'E-mail',
            validators: [
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context),
            ],
          ),
          TextFieldDefaultWidget(
            name: 'password',
            label: 'Senha',
            obscureText: true,
            validators: [
              FormBuilderValidators.required(context),
            ],
          ),
          ButtonDefaultWidget(
            text: 'Entrar',
            onPressed: this.validateForm,
            inLoad: SingInProvider.of(context).inLoad,
          ),
        ],
      ),
    );
  }
}
