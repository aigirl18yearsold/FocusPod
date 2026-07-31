import 'package:flutter/material.dart';
import '../services/schedule_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final schedules = ScheduleService.getSchedules();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FocusPod'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: schedules.isEmpty
            ? const Center(
                child: Text(
                  'No schedules available.\nTap + to create one.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  final schedule = schedules[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const Icon(Icons.schedule),
                      title: Text(schedule.title),
                      subtitle: Text(schedule.dateTime.toString()),
                      trailing: Icon(
                        schedule.completed
                            ? Icons.check_circle
                            : Icons.pending,
                        color: schedule.completed
                            ? Colors.green
                            : Colors.orange,
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
