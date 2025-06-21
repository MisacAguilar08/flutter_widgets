import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String imagePath;

  SlideInfo(
      {required this.title,
      required this.description,
      required this.imagePath});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Buscar Comida',
      description: 'Description for Slide 1',
      imagePath: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega Rapida',
      description: 'Description for Slide 2',
      imagePath: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      description: 'Description for Slide 3',
      imagePath: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageController = PageController();
  bool _isLastPage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _pageController.addListener(() {
      final page = _pageController.page ?? 0;
     if(!_isLastPage && page >=  (slides.length - 1.5)){
          _isLastPage = true;
     } else if(_isLastPage && page <=  (slides.length-1.5)){
      _isLastPage = false;
     }
     setState(() {});
    });
  }   


  dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => _Slide(
                    title: slide.title,
                    description: slide.description,
                    imagePath: slide.imagePath))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text('Salir'))),
          _isLastPage? Positioned(
            bottom: 30,
            right: 30,
              child: AnimatedAlign(
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 1000),
                child: FilledButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Continuar')),
              )): const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const _Slide(
      {required this.title,
      required this.description,
      required this.imagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        Text(title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(description, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
