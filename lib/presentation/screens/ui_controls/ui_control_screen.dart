import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_control_screen';
  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI Controls'),
        ),
        body: _UIControlsView());
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, bike, bus, train, airplane }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloperModeEnabled = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(physics: ClampingScrollPhysics(), children: [
      SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Enable advanced settings'),
          value: !isDeveloperModeEnabled,
          onChanged: (value) => setState(() {
                isDeveloperModeEnabled = !isDeveloperModeEnabled;
              })),
      ExpansionTile(
        title: Text("Vehiculos de transporte"),
        subtitle: Text('$selectedTransportation'),
        
        children: [
          RadioListTile(
              title: Text("Car"),
              subtitle: Text("Travel by car"),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (vallue) => setState(() {
                    selectedTransportation = Transportation.car;
                  })),
          RadioListTile(
              title: Text("Airplane"),
              subtitle: Text("Travel by airplane"),
              value: Transportation.airplane,
              groupValue: selectedTransportation,
              onChanged: (vallue) => setState(() {
                    selectedTransportation = Transportation.airplane;
                  })),
          RadioListTile(
              title: Text("Train"),
              subtitle: Text("Travel by train"),
              value: Transportation.train,
              groupValue: selectedTransportation,
              onChanged: (vallue) => setState(() {
                    selectedTransportation = Transportation.train;
                  })),
          RadioListTile(
              title: Text("Bike"),
              subtitle: Text("Travel by bike"),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (vallue) => setState(() {
                    selectedTransportation = Transportation.bike;
                  })),
          RadioListTile(
              title: Text("Bus"),
              subtitle: Text("Travel by bus"),
              value: Transportation.bus,
              groupValue: selectedTransportation,
              onChanged: (vallue) => setState(() {
                    selectedTransportation = Transportation.bus;
                  })),
        ],
      ),

      CheckboxListTile(
          title: Text('Desayuno?'),
          subtitle: Text('Enable to receive updates'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          })),
      CheckboxListTile(
          title: Text('Almuerzo?'),
          subtitle: Text('Enable to receive updates'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          })),
      CheckboxListTile(
          title: Text('Cena?'),
          subtitle: Text('Enable to receive updates'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          })),

    ]);
  }
}
