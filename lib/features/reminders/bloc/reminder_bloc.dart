import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_reminder_dependancy_injection/features/reminders/data/reminder_service.dart';
import 'package:task_reminder_dependancy_injection/service_locator.dart';

import 'reminder_event.dart';
import 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  // Access ReminderService via GetIt
  final ReminderService _reminderService = getIt<ReminderService>();

  // Initial state is ReminderInitial
  ReminderBloc() : super(ReminderInitial()) {
    // Define behavior for AddReminderEvent
    on<AddReminderEvent>((event, emit) {
      // Add new reminder to the service
      _reminderService.addReminder(event.task, event.time);

      // Emit updated state with new reminders
      emit(ReminderLoaded(_reminderService.reminders));
    });
  }
}
