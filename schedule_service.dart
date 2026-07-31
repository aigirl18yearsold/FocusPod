import '../models/schedule.dart';

class ScheduleService {
  static final List<Schedule> _schedules = [];

  static List<Schedule> getSchedules() {
    return List.unmodifiable(_schedules);
  }

  static void addSchedule(Schedule schedule) {
    _schedules.add(schedule);
  }

  static void removeSchedule(String id) {
    _schedules.removeWhere((schedule) => schedule.id == id);
  }

  static void toggleCompleted(String id) {
    final index = _schedules.indexWhere((s) => s.id == id);

    if (index != -1) {
      _schedules[index] = _schedules[index].copyWith(
        completed: !_schedules[index].completed,
      );
    }
  }
}
