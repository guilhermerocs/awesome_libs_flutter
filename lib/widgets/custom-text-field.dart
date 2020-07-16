import 'package:awsome_libs_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  final String value;
  final Function(dynamic) onChange;
  bool obscureText = false;

  CustomTextField(
      {this.labelText,
      this.textInputType,
      this.value,
      this.onChange,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration.collapsed(
          hintText: labelText,
          hintStyle: TextStyle(color: Constants.textFieldColor, fontSize: 16.0),
        ),
        keyboardType: textInputType,
        cursorColor: Constants.primaryColor,
        autocorrect: false,
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        onSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
        onChanged: (value) {
          if (this.onChange != null) this.onChange(value);
        });
  }
}

class CustomCardTextField extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  final String value;
  final Function(dynamic) onChange;
  final bool obscureText;

  CustomCardTextField(
      {this.labelText,
      this.textInputType,
      this.value,
      this.onChange,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 15.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 3.0, 12.0, 3.0),
        child: new CustomTextField(
          labelText: labelText,
          textInputType: textInputType,
          obscureText: obscureText,
          value: value,
          onChange: onChange,
        ),
      ),
    );
  }
}
