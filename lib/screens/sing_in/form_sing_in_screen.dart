import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:webhook_deploy_panel/widgets/button_default/button_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/form_default/form_default_widget.dart';
import 'package:webhook_deploy_panel/widgets/text_field_default/text_field_default_widget.dart';

class FormSingInScreen extends StatelessWidget {
  GlobalKey<FormBuilderState> _formKey;

  void validateForm() {
    final form = this._formKey.currentState;
    if (!form.saveAndValidate()) {
      return;
    }

    print('validateForm');
    print(form.value);
  }

  @override
  Widget build(BuildContext context) {
    return FormDefaultWidget(
      formKey: (formKey) {
        this._formKey = formKey;
      },
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
          validators: [
            FormBuilderValidators.required(context),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        ButtonDefaultWidget(
          text: 'Entrar',
          onPressed: this.validateForm,
        ),
      ],
    );
  }
}
