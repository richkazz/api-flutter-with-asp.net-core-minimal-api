import 'package:api_tempate_flutter/src/features/admin/presentation/bloc/bloc/admin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin_injection_container.dart';
import '../widgets/widget.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  static const routeName = '/Admin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminAppBar('SETTINGS'),
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Row(
      children: [
        NavSideBar(
          ctx: context,
        ),
      ],
    );
  }
}
