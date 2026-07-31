import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String scheduleKey = "focuspod_schedules";

  static Future<void> saveSchedules(List<Map<String, dynamic>> schedules) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      scheduleKey,
      jsonEncode(schedules),
    );
  }

  static Future<List<Map<String, dynamic>>> loadSchedules() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(scheduleKey);

    if (data == null) return [];

    final decoded = jsonDecode(data);

    return List<Map<String, dynamic>>.from(decoded);
  }
}
