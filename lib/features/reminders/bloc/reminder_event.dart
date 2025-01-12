// Base class for all ReminderBloc events
abstract class ReminderEvent {}

// Event to add a new reminder
class AddReminderEvent extends ReminderEvent {
  final String task; // Task description
  final String time; // Reminder time

  AddReminderEvent(this.task, this.time);
}
