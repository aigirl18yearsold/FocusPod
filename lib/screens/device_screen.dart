import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../services/bluetooth_service.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Devices"),
      ),

      body: StreamBuilder<List<ScanResult>>(
        stream: BluetoothService.scanDevices(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final devices = snapshot.data!;

          if (devices.isEmpty) {
            return const Center(
              child: Text("No devices found"),
            );
          }

          return ListView.builder(
            itemCount: devices.length,
            itemBuilder: (context, index) {

              final device = devices[index];

              return ListTile(

                leading: const Icon(Icons.bluetooth),

                title: Text(
                  device.device.platformName.isEmpty
                      ? "Unknown Device"
                      : device.device.platformName,
                ),

                subtitle: Text(device.device.remoteId.str),

                trailing: ElevatedButton(

                  child: const Text("Connect"),

                  onPressed: () async {

                    await BluetoothService.connect(
                      device.device,
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Connected to ${device.device.platformName}",
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    BluetoothService.stopScan();
    super.dispose();
  }
}
