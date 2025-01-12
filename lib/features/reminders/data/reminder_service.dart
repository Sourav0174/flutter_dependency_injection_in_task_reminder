class ReminderService {
  // Private list to store reminders
  final List<Map<String, String>> _reminders = [];

  // Getter to access reminders
  List<Map<String, String>> get reminders => _reminders;

  // Function to add a new reminder
  void addReminder(String task, String time) {
    _reminders.add({'task': task, 'time': time});
  }
}
