import '../models/schedule.dart';

class ScheduleService {
  static final List<Schedule> _schedules = [];

  static List<Schedule> getSchedules() {
    return _schedules;
  }

  static void addSchedule(Schedule schedule) {
    _schedules.add(schedule);
  }

  static void removeSchedule(String id) {
    _schedules.removeWhere((schedule) => schedule.id == id);
  }
}
