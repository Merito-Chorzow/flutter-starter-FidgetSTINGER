import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _darkMode = false;
  bool _metricUnits = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ustawienia')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Tryb ciemny'),
            subtitle: const Text('Włącz ciemny motyw'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Motyw zmieniony (symulacja)')),
              );
            },
          ),
          SwitchListTile(
            title: const Text('Jednostki metryczne'),
            subtitle: const Text('Używaj metrów i kilometrów'),
            value: _metricUnits,
            onChanged: (bool value) {
              setState(() {
                _metricUnits = value;
              });
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('O aplikacji'),
            subtitle: const Text('Geo Journal v1.0.0'),
            leading: const Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
