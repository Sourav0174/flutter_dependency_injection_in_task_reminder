import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_reminder_dependancy_injection/features/reminders/bloc/reminder_bloc.dart';
import 'package:task_reminder_dependancy_injection/features/reminders/bloc/reminder_event.dart';
import 'package:task_reminder_dependancy_injection/features/reminders/bloc/reminder_state.dart';

class ReminderScreen extends StatelessWidget {
  // Controllers to manage input fields
  final TextEditingController taskController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 255, 252), // Baby Blue
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section with Neomorphic Design
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: _neomorphicBoxDecoration(
                  backgroundColor: const Color(0xFFDBF5F0), // Baby Blue
                ),
                child: const Center(
                  child: Text(
                    'Task Reminder',
                    style: TextStyle(
                      color: Color(0xFF0C6170), // Midnight Blue
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Add New Task",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C6170), // Midnight Blue
                ),
              ),
              const SizedBox(height: 10),
              // Input field for task description
              _neomorphicInputField(
                controller: taskController,
                hintText: 'Task Name',
              ),
              const SizedBox(height: 10),
              // Input field for reminder time
              _neomorphicInputField(
                controller: timeController,
                hintText: 'Reminder Time (e.g., 2:00 PM)',
              ),
              const SizedBox(height: 20),
              // Add Reminder Button with Neomorphic Design
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (taskController.text.isNotEmpty &&
                        timeController.text.isNotEmpty) {
                      context.read<ReminderBloc>().add(
                            AddReminderEvent(
                              taskController.text,
                              timeController.text,
                            ),
                          );
                      taskController.clear();
                      timeController.clear();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: _neomorphicBoxDecoration(
                      backgroundColor: const Color(0xFFA4E5E0), // Tiffany Blue
                    ),
                    child: const Text(
                      'Add Reminder',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0C6170), // Midnight Blue
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Your Reminders",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C6170), // Midnight Blue
                ),
              ),
              const SizedBox(height: 10),
              // Display reminders using BlocBuilder
              Expanded(
                child: BlocBuilder<ReminderBloc, ReminderState>(
                  builder: (context, state) {
                    if (state is ReminderLoaded) {
                      if (state.reminders.isEmpty) {
                        return const Center(
                          child: Text(
                            'No reminders yet!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF37BEB0), // Blue Green
                            ),
                          ),
                        );
                      }
                      // Build a list of reminders
                      return ListView.separated(
                        itemCount: state.reminders.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final reminder = state.reminders[index];
                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: _neomorphicBoxDecoration(
                              backgroundColor: const Color(0xFFA4E5E0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Task name and reminder time
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      reminder['task'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color(0xFF0C6170), // Midnight Blue
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'At: ${reminder['time']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                // Delete button
                                IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  color: Colors.redAccent,
                                  onPressed: () {
                                    context.read<ReminderBloc>();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a reusable neomorphic input field
  Widget _neomorphicInputField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      decoration: _neomorphicBoxDecoration(
        backgroundColor: const Color(0xFFA4E5E0), // Tiffany Blue
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  // Neomorphic BoxDecoration
  BoxDecoration _neomorphicBoxDecoration({
    required Color backgroundColor,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        // Light shadow (top-left)
        BoxShadow(
          color: Colors.white.withOpacity(0.8),
          offset: const Offset(-4, -4),
          blurRadius: 8,
        ),
        // Dark shadow (bottom-right)
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(4, 4),
          blurRadius: 8,
        ),
      ],
    );
  }
}
