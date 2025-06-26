import 'package:flutter/material.dart';


const ColorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];
class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({ this.selectedColor =  0, this.isDarkMode = false }): assert(
      selectedColor >= 0 && selectedColor < ColorList.length, 'selectedColor must be between 0 and 4 inclusive'
  );

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ColorList[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

}