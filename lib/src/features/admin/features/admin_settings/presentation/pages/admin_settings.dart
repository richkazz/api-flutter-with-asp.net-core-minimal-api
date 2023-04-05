import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';
import '../bloc/admin_settings_bloc.dart';
import 'package:api_tempate_flutter/src/features/admin/admin_injection_container.dart';

class AdminSettings extends StatelessWidget {
  const AdminSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AdminSettingsBloc>(),
      child: Container(
        color: const Color.fromRGBO(217, 217, 217, 1),
        child: Column(children: const [
          Section1(),
          SizedBox(
            height: 10,
          ),
          Section2(),
          Section3(),
        ]),
      ),
    );
  }
}
