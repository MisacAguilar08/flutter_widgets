import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:funciones_widgets/presentation/providers/provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
     bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    void setCounter(int value) {
      ref.read(counterProvider.notifier).state = value;
    }

    void chageTheme() {
      ref.read(themeNotifierProvider.notifier).toggleTheme();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: isDarkMode? const Icon(Icons.light_mode_outlined):const Icon(Icons.dark_mode_outlined),
            onPressed: chageTheme,
          )
        ],
      ),
      body: Center(
        child: Text('valor: $counter', style: TextStyle(fontSize: 40)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setCounter(counter + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
