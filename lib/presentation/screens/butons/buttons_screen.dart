import 'package:flutter/material.dart';


class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add your onPressed logic here
          },
          child: Text('Click Me'),
        ),
      ),
    );
  }
}