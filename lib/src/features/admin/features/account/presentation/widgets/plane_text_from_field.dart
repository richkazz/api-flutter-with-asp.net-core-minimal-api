import 'package:api_tempate_flutter/util/input_validation.dart';
import 'package:api_tempate_flutter/widgets/text_field.dart';
import 'package:flutter/material.dart';

class PlaneTextFormField extends StatelessWidget {
  const PlaneTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$labelText:',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: textField(
                  context: context,
                  validator: InputValidator.nameValidator,
                  keyboard: TextInputType.text,
                  hintText: labelText,
                  labelText: labelText,
                  controller: controller),
            ),
          ),
        ],
      ),
    );
  }
}
