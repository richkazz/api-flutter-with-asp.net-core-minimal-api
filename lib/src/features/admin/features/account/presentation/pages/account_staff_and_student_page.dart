import 'package:api_tempate_flutter/core/constants/layout.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/enums/staff_and_student_enums.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/widgets/staff_and_student_account_card.dart';
import 'package:flutter/material.dart';

class StaffAndStudentPage extends StatelessWidget {
  const StaffAndStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Layout layout = Layout(context: context);
    return SizedBox(
      height: layout.height! * 0.9,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              StaffAndStudentAccountCard(
                  staffAndStudent: StaffAndStudent.staff),
              StaffAndStudentAccountCard(
                  staffAndStudent: StaffAndStudent.student),
            ],
          )
        ],
      ),
    );
    ;
  }
}
