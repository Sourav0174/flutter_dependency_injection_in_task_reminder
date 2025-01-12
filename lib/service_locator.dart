import 'package:get_it/get_it.dart';
import 'package:task_reminder_dependancy_injection/features/reminders/data/reminder_service.dart';

// Initialize GetIt instance
final getIt = GetIt.instance;

// Function to register services for dependency injection
void setupLocator() {
  // Register ReminderService as a singleton
  getIt.registerLazySingleton<ReminderService>(() => ReminderService());
}
