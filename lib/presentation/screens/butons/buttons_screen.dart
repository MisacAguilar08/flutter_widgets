import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Wrap(
          spacing: 10.0,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
            ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarms_rounded),
                label: Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                label: Text('Filled Icon'),
                icon: Icon(Icons.file_upload)),
            OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
            OutlinedButton.icon(
                onPressed: () {},
                label: Text('Outlined Icon'),
                icon: Icon(Icons.outlined_flag)),
            TextButton(onPressed: () {}, child: Text('Text Button')),
            TextButton.icon(
                onPressed: () {},
                label: Text('Text Icon'),
                icon: Icon(Icons.text_fields)),
            IconButton(onPressed: () {}, icon: Icon(Icons.info_outline)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.brightness_6),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(colors.primary),
                    iconColor:
                        WidgetStateProperty.all<Color>(colors.onPrimary))),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            print("Button tapped");
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text("Hola Mundo", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
