import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothService {
  static final FlutterBluePlus bluetooth = FlutterBluePlus();

  static Stream<List<ScanResult>> scanDevices() {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    return FlutterBluePlus.scanResults;
  }

  static Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  static Future<void> connect(BluetoothDevice device) async {
    await device.connect();
  }

  static Future<void> disconnect(BluetoothDevice device) async {
    await device.disconnect();
  }
}
