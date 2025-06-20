import 'package:flutter/material.dart';
import 'package:funciones_widgets/config/menu/MenuItem.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {

    static const String name = 'home_screen';

  const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Flutter + Material 3'),
            ),
            body: _HomeView(),
        );
    }
}

class _HomeView extends StatelessWidget {

  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomeListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomeListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomeListTile({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () => context.push(menuItem.link),
    );
  }
}