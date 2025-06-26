import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:funciones_widgets/config/theme/app_theme.dart';

import 'config/router/router.dart';
import 'presentation/providers/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedColor = ref.watch(selectedColorProvider);
    // final isMode = ref.watch(isDarkModeProvider);

    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture App',
      theme: appTheme.getTheme(),
    );
  }
}


