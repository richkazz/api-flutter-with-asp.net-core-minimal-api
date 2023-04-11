import 'package:api_tempate_flutter/core/constants/layout.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/enums/account_page_enum.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/enums/staff_and_student_enums.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/bloc/bloc/account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffAndStudentAccountCard extends StatelessWidget {
  const StaffAndStudentAccountCard({
    super.key,
    required this.staffAndStudent,
  });

  final StaffAndStudent staffAndStudent;

  @override
  Widget build(BuildContext context) {
    Layout layout = Layout(context: context);
    void onStaffOrStudentClick() {
      if (staffAndStudent == StaffAndStudent.staff) {
        context.read<AccountBloc>().add(
            const AccountPageChangeEvent(AccountPageChange.teacherRegister));
      }
    }

    return GestureDetector(
      onTap: onStaffOrStudentClick,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(1, 1, 1),
          child: Container(
            width: layout.width! * 0.2,
            height: layout.width! * 0.22,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.accessible_rounded,
                  size: 80,
                ),
                Text(staffAndStudent.asString)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
