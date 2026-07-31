import 'models/schedule.dart';
import 'services/schedule_service.dart';
ScheduleService.addSchedule(
  Schedule(
    id: "1",
    title: "Physics Study",
    dateTime: DateTime.now().add(
      const Duration(hours: 2),
    ),
  ),
);
