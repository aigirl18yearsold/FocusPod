import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool bluetoothEnabled = true;
  bool notificationsEnabled = true;
  bool darkMode = false;
  bool autoConnect = true;

  double volume = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [

          SwitchListTile(
            title: const Text("Bluetooth"),
            subtitle: const Text("Enable Bluetooth connection"),
            value: bluetoothEnabled,
            onChanged: (value) {
              setState(() {
                bluetoothEnabled = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Notifications"),
            subtitle: const Text("Receive reminder notifications"),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Auto Connect"),
            subtitle: const Text("Automatically connect to FocusPod"),
            value: autoConnect,
            onChanged: (value) {
              setState(() {
                autoConnect = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Enable dark theme"),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Reminder Volume",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Slider(
            value: volume,
            min: 0,
            max: 100,
            divisions: 10,
            label: "${volume.round()}%",
            onChanged: (value) {
              setState(() {
                volume = value;
              });
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            subtitle: const Text("FocusPod Version 0.1"),
          ),
        ],
      ),
    );
  }
}
