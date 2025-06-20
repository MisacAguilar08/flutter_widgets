import 'package:flutter/material.dart';


class SlideInfo {
    final String title;
    final String description;
    final String imagePath;

    SlideInfo({required this.title, required this.description, required this.imagePath});
}

final slides = <SlideInfo>[
  SlideInfo(title: 'Buscar Comida', description: 'Description for Slide 1', imagePath: 'assets/images/1.png'),
  SlideInfo(title: 'Entrega Rapida', description: 'Description for Slide 2', imagePath: 'assets/images/2.png'),
  SlideInfo(title: 'Disfruta la comida', description: 'Description for Slide 3', imagePath: 'assets/images/3.png'),
];


class AppTutorialScreen extends StatelessWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const BouncingScrollPhysics(),
          children: slides.map((slide) => _Slide(title: slide.title, description: slide.description, imagePath: slide.imagePath)).toList()
        ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title; 
  final String description;
  final String imagePath;
  const _Slide({required this.title, required this.description, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath),
              Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(description, style: TextStyle(fontSize: 16)),
            ],
          );
  }
}