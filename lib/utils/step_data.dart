import 'package:flutter/material.dart';
import 'package:restocknow/utils/notification_preferences.dart';

class StepData {
  final String title;
  final Widget content;

  StepData({required this.title, required this.content});
}

// Generate steps dynamically based on the current step
List<Step> generateSteps({
  required int currentStep,
  required Function() onSubmit,
}) {
  return [
    Step(
      title: const Text('Step 1: Add Link', style: TextStyle(fontWeight: FontWeight.bold)),
      content: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Item Link',
            border: OutlineInputBorder(),
          ),
        ),
      ),
      isActive: currentStep >= 0,
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: const Text('Step 2: Choose Preferences', style: TextStyle(fontWeight: FontWeight.bold),),
      content: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text('Size, Color, etc.'),
      ), // TODO: Add content for step 2
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: const Text('Step 3: Notification Methods', style: TextStyle(fontWeight: FontWeight.bold),),
      content: NotificationPreferences().notificationPreferences(), // TODO: Make notification preferences dynamic
      isActive: currentStep >= 2,
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: const Text('Step 4: Review & Submit', style: TextStyle(fontWeight: FontWeight.bold),),
      content: const Text('Review your preferences before submission.'),
      isActive: currentStep == 3,
      state: currentStep == 3 ? StepState.editing : StepState.indexed,
    ),
  ];
}