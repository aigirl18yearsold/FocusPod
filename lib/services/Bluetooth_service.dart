import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../models/schedule.dart';

class BluetoothService {
  static final FlutterBluePlus bluetooth = FlutterBluePlus();

  static BluetoothDevice? connectedDevice;

  static Future<void> connect(BluetoothDevice device) async {
    await device.connect();
    connectedDevice = device;
  }

  static Future<void> disconnect() async {
    if (connectedDevice != null) {
      await connectedDevice!.disconnect();
      connectedDevice = null;
    }
  }

  static Future<void> syncSchedules(
    List<Schedule> schedules,
  ) async {
    if (connectedDevice == null) return;

    final data = schedules
        .map(
          (e) => {
            "title": e.title,
            "dateTime": e.dateTime.toIso8601String(),
            "completed": e.completed,
          },
        )
        .toList();

    final json = jsonEncode(data);

    final services =
        await connectedDevice!.discoverServices();

    for (final service in services) {
      for (final characteristic
          in service.characteristics) {
        if (characteristic.properties.write) {
          await characteristic.write(
            utf8.encode(json),
          );
          return;
        }
      }
    }
  }
}
