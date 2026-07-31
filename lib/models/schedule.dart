class Schedule {
  final String id;
  final String title;
  final DateTime dateTime;
  final bool completed;

  Schedule({
    required this.id,
    required this.title,
    required this.dateTime,
    this.completed = false,
  });

  Schedule copyWith({
    String? id,
    String? title,
    DateTime? dateTime,
    bool? completed,
  }) {
    return Schedule(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      completed: completed ?? this.completed,
    );
  }
}
