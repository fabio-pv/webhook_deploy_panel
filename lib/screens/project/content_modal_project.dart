import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:webhook_deploy_panel/models/project.dart';
import 'package:webhook_deploy_panel/providers/project_provider.dart';
import 'package:webhook_deploy_panel/widgets/modal/simple_modal_widget.dart';
import 'package:webhook_deploy_panel/widgets/text_field_default/text_field_default_widget.dart';

class ContentModalProject extends StatefulWidget {
  @override
  _ContentModalProjectState createState() => _ContentModalProjectState();
}

class _ContentModalProjectState extends State<ContentModalProject> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _validateForm({
    bool update = false,
    Project object,
  }) {
    this._formKey.currentState.setInternalFieldValue('uuid', object.uuid);
    final form = this._formKey.currentState;
    if (!form.saveAndValidate()) {
      return;
    }

    if (update) {
      ProjectProvider.of(context).doUpdateProject(form.value, object);
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
      objectUpdate: projectProvider.selectProject,
      child: [
        FormBuilder(
          key: this._formKey,
          initialValue: projectProvider.selectProject?.toJson(),
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
