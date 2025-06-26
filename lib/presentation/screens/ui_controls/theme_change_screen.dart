import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/theme/app_theme.dart';
import '../../providers/theme_provider.dart';

class ThemeChangeScreen extends ConsumerWidget {
  static const String name = "theme_change_screen";
  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Change Screen'),
        actions: [
          IconButton(
            icon: isDarkMode
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
            onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
          )
        ],
      ),
      body: _ThemeChangerView()
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsListProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index){
        final Color color = colors[index];
        return RadioListTile(
          title: Text("Este color", style: TextStyle(color: color)),
          subtitle: Text("${color.value}"),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value){
            ref.read(themeNotifierProvider.notifier).changeSelectedColor(index);
          });
      });
  }
}
