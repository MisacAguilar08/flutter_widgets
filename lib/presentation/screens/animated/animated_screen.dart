import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double widthAnimated = 100;
  double heightAnimated = 100;
  Color colorAnimated = Colors.blue;
  double borderRadiusAnimated = 10;

  @override
  void initState() {
    super.initState();
    
  }

  void toggleAnimation() {
    setState(() {
      // Add logic to toggle animation properties here
      heightAnimated = Random().nextInt(300).toDouble() + 50;
      widthAnimated = Random().nextInt(300).toDouble()+ 50;
      borderRadiusAnimated = Random().nextInt(100).toDouble() + 10;
      colorAnimated = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Screen'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: widthAnimated <= 0 ? 0: widthAnimated,
          height: heightAnimated <= 0 ? 0: heightAnimated,
          decoration: BoxDecoration(color: colorAnimated, borderRadius: BorderRadius.circular(borderRadiusAnimated <= 0 ? 0: borderRadiusAnimated)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleAnimation,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
