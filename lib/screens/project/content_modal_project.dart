import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:webhook_deploy_panel/widgets/modal/simple_modal_widget.dart';
import 'package:webhook_deploy_panel/widgets/text_field_default/text_field_default_widget.dart';

class ContentModalProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleModalWidget(
      child: [
        FormBuilder(
          child: Column(
            children: [
              TextFieldDefaultWidget(
                name: 'name',
                label: 'Name',
                validators: [
                  FormBuilderValidators.required(context),
                ],
              ),
              TextFieldDefaultWidget(
                name: 'directory',
                label: 'Directory',
                validators: [
                  FormBuilderValidators.required(context),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
