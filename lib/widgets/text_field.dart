import 'package:flutter/material.dart';

TextFormField textField(
    {required TextInputType keyboard,
    required String? hintText,
    required String? labelText,
    required Function validator,
    bool obscureText = false,
    required TextEditingController controller,
    FocusNode? focusNode}) {
  return TextFormField(
      validator: (val) => validator(val),
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboard,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 16),
      ));
}
