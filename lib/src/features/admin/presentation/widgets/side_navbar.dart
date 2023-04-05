import 'package:api_tempate_flutter/src/features/admin/presentation/bloc/bloc/admin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin_injection_container.dart';
import '../../features/admin_settings/presentation/pages/admin_settings.dart';

Padding navItems(
    IconData icon, String title, bool showOnlyIcon, BuildContext context) {
  final mediaQueryData = MediaQuery.of(context);
  final screenWidth = mediaQueryData.size.width;
  final fontSize = screenWidth > 900 ? 20.0 : 10.0;
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Row(
      children: [
        Expanded(
          child: Icon(
            icon,
            size: screenWidth > 800 ? 30 : 20,
            color: Colors.white,
          ),
        ),
        showOnlyIcon
            ? Container()
            : const SizedBox(
                width: 10,
              ),
        showOnlyIcon
            ? Container()
            : SizedBox(
                width: MediaQuery.of(context).size.width * 0.12,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
                ),
              )
      ],
    ),
  );
}

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
    return BlocProvider(
      create: (_) => sl<AdminBloc>(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: (_leftAnimation.value * 100).round(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: const Color.fromRGBO(53, 65, 79, 1),
                child: !_isExpanded || _animationController.isAnimating
                    ? Column(
                        children: [
                          InkWell(
                              onTap: _toggleExpanded,
                              child: navItems(
                                  Icons.navigation, '', true, context)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          navItems(Icons.person, 'ACCOUNTS', true, context),
                          navItems(Icons.recent_actors_outlined, 'RESULT', true,
                              context),
                          navItems(Icons.app_registration, 'COURSES  REG', true,
                              context),
                          navItems(Icons.newspaper, 'NEWS', true, context),
                          navItems(Icons.money, 'FEES', true, context),
                          navItems(
                              Icons.password, 'CHANGE PASSWORD', true, context),
                          navItems(Icons.settings, 'SETTING', true, context),
                        ],
                      )
                    : Column(
                        children: [
                          InkWell(
                              onTap: _toggleExpanded,
                              child: navItems(
                                  Icons.navigation, '', false, context)),
                          Container(
                            color: Colors.white,
                            height: 1,
                          ),
                          navItems(Icons.person, 'ACCOUNTS', false, context),
                          navItems(Icons.recent_actors_outlined, 'RESULT',
                              false, context),
                          navItems(Icons.app_registration, 'COURSES  REG',
                              false, context),
                          navItems(Icons.newspaper, 'NEWS', false, context),
                          navItems(Icons.money, 'FEES', false, context),
                          navItems(Icons.password, 'CHANGE PASSWORD', false,
                              context),
                          navItems(Icons.settings, 'SETTING', false, context),
                        ],
                      ),
              ),
            ),
            Expanded(
              flex: (_rightAnimation.value * 100).round(),
              child: BlocBuilder<AdminBloc, AdminState>(
                builder: (context, state) {
                  return const AdminSettings();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
