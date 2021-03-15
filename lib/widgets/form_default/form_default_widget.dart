import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormDefaultWidget extends StatefulWidget {
  final List<Widget> children;
  final Function(GlobalKey<FormBuilderState>) formKey;

  FormDefaultWidget({
    this.children,
    this.formKey,
  });

  @override
  _FormDefaultWidgetState createState() => _FormDefaultWidgetState();
}

class _FormDefaultWidgetState extends State<FormDefaultWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    widget.formKey(this._formKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: this._formKey,
      child: Column(
        children: this.widget.children,
      ),
    );
  }
}
