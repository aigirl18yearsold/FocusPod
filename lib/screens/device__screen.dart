ElevatedButton.icon(
  onPressed: () async {
    await BluetoothService.syncSchedules(
      ScheduleService.getSchedules(),
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Schedules synchronized successfully.",
          ),
        ),
      );
    }
  },
  icon: const Icon(Icons.sync),
  label: const Text("Sync FocusPod"),
),
