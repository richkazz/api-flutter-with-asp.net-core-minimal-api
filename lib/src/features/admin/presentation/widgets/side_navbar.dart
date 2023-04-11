import 'package:api_tempate_flutter/core/constants/layout.dart';
import 'package:api_tempate_flutter/src/features/admin/enums/admin_enums.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/pages/account_page.dart';
import 'package:api_tempate_flutter/src/features/admin/presentation/bloc/bloc/admin_bloc.dart';
import 'package:api_tempate_flutter/src/features/admin/presentation/widgets/admin_navitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin_injection_container.dart';
import '../../features/admin_settings/presentation/pages/admin_settings.dart';

class NavSideBar extends StatefulWidget {
  const NavSideBar({super.key, required this.ctx});
  final BuildContext ctx;
  @override
  State<NavSideBar> createState() => _NavSideBarState();
}

class _NavSideBarState extends State<NavSideBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _leftAnimation;
  late Animation<double> _rightAnimation;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _leftAnimation =
        Tween<double>(begin: 0.2, end: 0.05).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _rightAnimation =
        Tween<double>(begin: 0.8, end: 0.95).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    Layout layout = Layout(context: context);
    return BlocProvider(
      create: (_) => sl<AdminBloc>(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: BlocBuilder<AdminBloc, AdminState>(
                buildWhen: (previous, current) {
                  return isAPageSwitchState(current);
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: state is AccountPageState
                        ? const AccountPage()
                        : state is SettingsPageState
                            ? const AdminSettings()
                            : const AccountPage(),
                  );
                },
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: 60,
                color: const Color.fromRGBO(53, 65, 79, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: _toggleExpanded,
                        child: const NavItems(
                            icon: Icons.navigation, showOnlyIcon: true)),
                    Container(
                      color: Colors.white,
                      height: 1,
                    ),
                    const NavItems(
                        icon: Icons.person,
                        page: PageChange.account,
                        showOnlyIcon: true),
                    const NavItems(
                        icon: Icons.recent_actors_outlined,
                        page: PageChange.result,
                        showOnlyIcon: true),
                    const NavItems(
                        icon: Icons.app_registration,
                        page: PageChange.courseRegisteration,
                        showOnlyIcon: true),
                    const NavItems(
                        icon: Icons.newspaper,
                        page: PageChange.news,
                        showOnlyIcon: true),
                    const NavItems(
                        icon: Icons.money,
                        page: PageChange.fees,
                        showOnlyIcon: true),
                    const NavItems(
                        icon: Icons.password,
                        page: PageChange.changePassword,
                        showOnlyIcon: true),
                    const NavItems(
                        icon: Icons.settings,
                        page: PageChange.settings,
                        showOnlyIcon: true),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  bool isAPageSwitchState(AdminState current) =>
      current is AccountPageState || current is SettingsPageState;
}
