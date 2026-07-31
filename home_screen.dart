ListTile(
  leading: Checkbox(
    value: schedule.completed,
    onChanged: (_) {
      ScheduleService.toggleCompleted(schedule.id);
      (context as Element).markNeedsBuild();
    },
  ),

  title: Text(
    schedule.title,
    style: TextStyle(
      decoration: schedule.completed
          ? TextDecoration.lineThrough
          : null,
    ),
  ),

  subtitle: Text(schedule.dateTime.toString()),

  trailing: IconButton(
    icon: const Icon(
      Icons.delete,
      color: Colors.red,
    ),
    onPressed: () {
      ScheduleService.removeSchedule(schedule.id);
      (context as Element).markNeedsBuild();
    },
  ),
)
