import 'package:api_tempate_flutter/src/features/admin/features/account/enums/gender.dart';
import 'package:flutter/material.dart';

class GenderClass {
  Gender gender = Gender.male;
}

class GenderFromField extends StatefulWidget {
  const GenderFromField({super.key, required this.gender});

  final GenderClass gender;

  @override
  State<GenderFromField> createState() => _GenderFromFieldState();
}

class _GenderFromFieldState extends State<GenderFromField> {
  void onGenderRadioSelect(val) {
    setState(() {
      widget.gender.gender = val;
    });
  }

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
              'Gender:',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text('Male', style: Theme.of(context).textTheme.bodySmall),
                Radio(
                    activeColor: Colors.black,
                    value: Gender.male,
                    groupValue: widget.gender.gender,
                    onChanged: onGenderRadioSelect),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text('Female', style: Theme.of(context).textTheme.bodySmall),
                Radio(
                    activeColor: Colors.black,
                    value: Gender.female,
                    groupValue: widget.gender.gender,
                    onChanged: onGenderRadioSelect),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text('Other', style: Theme.of(context).textTheme.bodySmall),
                Radio(
                    activeColor: Colors.black,
                    value: Gender.unknown,
                    groupValue: widget.gender.gender,
                    onChanged: onGenderRadioSelect),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
