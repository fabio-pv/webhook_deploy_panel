import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFieldDefaultWidget extends StatefulWidget {
  static const marginDefault = EdgeInsets.only(
    bottom: 20,
  );

  final String name;
  final String label;
  final Function(String) onChanged;
  final List<String Function(String)> validators;
  final TextInputType textInputType;
  final EdgeInsets margin;

  TextFieldDefaultWidget({
    @required this.name,
    @required this.label,
    @required this.validators,
    this.onChanged,
    this.textInputType,
    this.margin = marginDefault,
  });

  @override
  _TextFieldDefaultWidgetState createState() => _TextFieldDefaultWidgetState();
}

class _TextFieldDefaultWidgetState extends State<TextFieldDefaultWidget> {
  FocusNode _focusNode = FocusNode();
  Color color;

  @override
  Widget build(BuildContext context) {
    color = _focusNode.hasFocus
        ? Theme.of(context).accentColor
        : Theme.of(context).primaryColor;

    _focusNode.addListener(() {
      setState(() {
        color = color;
      });
    });

    return Container(
      height: 80,
      child: FormBuilderTextField(
        focusNode: this._focusNode,
        name: this.widget.name,
        cursorColor: Theme.of(context).accentColor,
        style: TextStyle(
          color: this.color,
        ),
        decoration: InputDecoration(
          labelText: this.widget.label,
          focusColor: Theme.of(context).accentColor,
          fillColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            color: this.color,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
              width: 2.0,
            ),
          ),
        ),
        onChanged: this.widget.onChanged,
        validator: FormBuilderValidators.compose(
          this.widget.validators,
        ),
        keyboardType: this.widget.textInputType,
      ),
    );
  }
}
