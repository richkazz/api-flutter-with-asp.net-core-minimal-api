import 'package:api_tempate_flutter/core/constants/layout.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/enums/staff_and_student_enums.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/bloc/bloc/account_bloc.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/pages/account_staff_and_student_page.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/pages/account_teacher_registeration_page.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/widgets/staff_and_student_account_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../admin_injection_container.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    Layout layout = Layout(context: context);
    return BlocProvider(
      create: (context) => sl<AccountBloc>(),
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return state is TeacherRegisterationState
              ? const TeacherRegisterationPage()
              : state is StaffAndStudentState
                  ? const StaffAndStudentPage()
                  : const StaffAndStudentPage();
        },
      ),
    );
  }
}
