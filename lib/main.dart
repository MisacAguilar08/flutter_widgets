import 'package:flutter/material.dart';
import 'package:funciones_widgets/config/theme/app_theme.dart';

import 'config/router/router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture App',
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}


