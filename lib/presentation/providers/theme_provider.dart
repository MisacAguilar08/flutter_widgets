

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:funciones_widgets/config/theme/app_theme.dart';



//Valor/ers inmutables
final colorsListProvider = Provider((ref) => ColorList);

//Mantener estados
final themeProvider = StateProvider<ThemeData>((ref) => ThemeData.light());

final isDarkModeProvider =  StateProvider<bool>((ref) => false);

final selectedColorProvider = StateProvider<int>((ref) => 0);

//Estados mas complejos
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());


class ThemeNotifier extends StateNotifier<AppTheme> {
    ThemeNotifier() : super(AppTheme());

    void toggleTheme() {
        state = state.copyWith(isDarkMode: !state.isDarkMode);
    }

    void changeSelectedColor(int colorIndex) {
        state = state.copyWith(selectedColor: colorIndex);
    }


}
