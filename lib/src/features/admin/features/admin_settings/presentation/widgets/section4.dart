import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/presentation/bloc/admin_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Section4 extends StatelessWidget {
  const Section4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => _saveAdminSettingData(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(200, 50),
            ),
            child: const Text('SAVE'),
          )
        ],
      ),
    );
  }

  void _saveAdminSettingData(BuildContext context) {
    context.read<AdminSettingsBloc>().add(PostAdminSettingsEvent());
  }
}
