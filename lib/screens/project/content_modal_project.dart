import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:webhook_deploy_panel/providers/project_provider.dart';
import 'package:webhook_deploy_panel/widgets/modal/simple_modal_widget.dart';
import 'package:webhook_deploy_panel/widgets/text_field_default/text_field_default_widget.dart';

class ContentModalProject extends StatefulWidget {
  @override
  _ContentModalProjectState createState() => _ContentModalProjectState();
}

class _ContentModalProjectState extends State<ContentModalProject> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _validateForm() {
    final form = this._formKey.currentState;
    if (!form.saveAndValidate()) {
      return;
    }

    ProjectProvider.of(context).doCreateProject(form.value);
  }

  @override
  Widget build(BuildContext context) {
    final projectProvider = ProjectProvider.of(context);

    return SimpleModalWidget(
      closeModal: projectProvider.addProject,
      onPressCancel: projectProvider.addProject,
      onPressSave: this._validateForm,
      child: [
        FormBuilder(
          key: this._formKey,
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
