import 'package:flutter/material.dart';


const ColorList = <Color>[
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange
];
class AppTheme {

  final int selectedColor;

  AppTheme({ this.selectedColor =  0}):assert(
      selectedColor >= 0 && selectedColor < ColorList.length, 'selectedColor must be between 0 and 4 inclusive'
  );

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ColorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }

}