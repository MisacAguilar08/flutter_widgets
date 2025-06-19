import 'package:flutter/material.dart';


class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Progress Indicator'),
        ),
        body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text("Loading..."),
            CircularProgressIndicator(strokeWidth: 2,color: Colors.black45,),
            SizedBox(height: 20),
            Text("Controlado Loading..."),
            _CotrolledProgressIndicator()
          ],
        ),
    );
  }
}

class _CotrolledProgressIndicator extends StatelessWidget {
  const _CotrolledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: Stream.periodic( const Duration(milliseconds: 300), (value){
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final  progressValue = (snapshot.data as double?) ?? 0.0;

        return Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            CircularProgressIndicator(value: progressValue, strokeWidth: 2, color: Colors.black12),
            SizedBox(width: 20),
            Expanded(child: LinearProgressIndicator(value: progressValue))
          ],
        ),);
      }
    );
  }
}