import 'package:api_tempate_flutter/core/constants/layout.dart';
import 'package:api_tempate_flutter/src/features/admin/enums/admin_enums.dart';
import 'package:api_tempate_flutter/src/features/admin/presentation/bloc/bloc/admin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavItems extends StatelessWidget {
  const NavItems(
      {super.key, required this.icon, required this.showOnlyIcon, this.page});
  final IconData icon;
  final PageChange? page;
  final bool showOnlyIcon;

  @override
  Widget build(BuildContext context) {
    Layout layout = Layout(context: context);
    final fontSize = layout.width! > 900 ? 20.0 : 10.0;
    void onTapToChangePage() {
      if (page != null) {
        context.read<AdminBloc>().add(ChangePageEvent(page!));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: onTapToChangePage,
        child: Row(
          children: [
            Icon(
              icon,
              size: layout.isLargeScreen ? 30 : 20,
              color: Colors.white,
            ),
            showOnlyIcon
                ? Container()
                : const SizedBox(
                    width: 10,
                  ),
            showOnlyIcon
                ? Container()
                : SizedBox(
                    width: layout.width! * 0.12,
                    child: Text(
                      page == null ? "" : page!.toPageChangeString,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: fontSize),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
