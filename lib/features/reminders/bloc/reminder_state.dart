// Base class for all ReminderBloc states
abstract class ReminderState {}

// Initial state when the app starts
class ReminderInitial extends ReminderState {}

// State when reminders are loaded
class ReminderLoaded extends ReminderState {
  final List<Map<String, String>> reminders; // List of reminders

  ReminderLoaded(this.reminders);
}
