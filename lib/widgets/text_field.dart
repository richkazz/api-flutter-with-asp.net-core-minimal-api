import 'package:flutter/material.dart';

TextFormField textField(
    {required TextInputType keyboard,
    required String? hintText,
    required String? labelText,
    required Function validator,
    bool obscureText = false,
    required TextEditingController controller,
    required BuildContext context,
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
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodySmall,
      ));
}
