import 'package:flutter/material.dart';
import 'package:funciones_widgets/config/menu/MenuItem.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      onDestinationSelected: (int index) {
        setState(() {
          navDrawerIndex = index;
        });

        final menuIndex = appMenuItems[index];
        context.push(menuIndex.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      selectedIndex: navDrawerIndex,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text("Menu"),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (n) => NavigationDrawerDestination(
                  icon: Icon(n.icon), label: Text(n.title)),
            ),
        Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text("More Options"),
        ),
        ...appMenuItems.sublist(3).map(
              (n) => NavigationDrawerDestination(
                  icon: Icon(n.icon), label: Text(n.title)),
            ),
      ],
    );
  }
}
