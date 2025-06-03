import 'package:flutter/material.dart';
import 'package:funciones_widgets/config/theme/app_theme.dart';
import 'package:funciones_widgets/presentation/screens/home/home_screen.dart';

import 'presentation/screens/butons/buttons_screen.dart';
import 'presentation/screens/cars/cards_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture App',
      theme: AppTheme(selectedColor: 0).getTheme(),
      home:  HomeScreen(),
      routes: {
        // '/': (context) => HomeScreen(),
        '/cards': (context) => CardsScreen(),
        '/buttons': (context) => ButtonsScreen()
      },
    );
  }
}


