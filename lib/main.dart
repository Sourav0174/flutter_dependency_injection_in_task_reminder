import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_reminder_dependancy_injection/features/reminders/bloc/reminder_bloc.dart';

import 'features/reminders/presentation/reminder_screen.dart';
import 'service_locator.dart';

void main() {
  // Set up the service locator before app starts
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        // Provide ReminderBloc to the widget tree
        create: (_) => ReminderBloc(),
        child: ReminderScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
