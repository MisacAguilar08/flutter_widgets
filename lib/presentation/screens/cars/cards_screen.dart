import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Screen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ...cards.map((card) =>
            _CardTpe1(label: card['label'], elevation: card['elevation'])),
        ...cards.map((card) =>
            _CardTpe2(label: card['label'], elevation: card['elevation'])),
        ...cards.map((card) =>
            _CardTpe3(label: card['label'], elevation: card['elevation'])),
        ...cards.map((card) =>
            _CardTpe4(label: card['label'], elevation: card['elevation'])),
        SizedBox(height: 50)
      ]),
    );
  }
}

class _CardTpe1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardTpe1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.more_vert_outlined))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          )
        ]),
      ),
    );
  }
}

class _CardTpe2 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardTpe2({required this.label, required this.elevation});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: colors.outline, width: 1)),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.more_vert_outlined))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          )
        ]),
      ),
    );
  }
}

class _CardTpe3 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardTpe3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceContainerHighest,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.more_vert_outlined))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('$label - Filled'),
          )
        ]),
      ),
    );
  }
}

class _CardTpe4 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardTpe4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(children: [
        Image.network('https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 350, fit: BoxFit.cover),
        Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              ),
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
            )),
      ]),
    );
  }
}
