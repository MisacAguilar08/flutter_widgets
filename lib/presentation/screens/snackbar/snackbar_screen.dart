import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This is a snackbar!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('Dialog Title'),
              content: Text('Dialog content'),
              actions: [
                TextButton(onPressed: ()=> context.pop(), child: Text("Cancelar"),),
                FilledButton(onPressed: () => context.pop(), child: Text("Aceptar"),)
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snackbar Screen'),
        ),
        body: Center(
            child: Column(
          children: [
            FilledButton(
                onPressed: () {
                  showAboutDialog(
                      context: context, children: [Text('Licencias usadas')]);
                },
                child: Text('Licencias usadas')),
            FilledButton(onPressed: () => openDialog(context), child: Text('Mostrar dialogos'))
          ],
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showSnackbar(context),
          label: const Text('Extended FAB'),
          icon: const Icon(Icons.remove_red_eye_outlined),
        ));
  }
}
