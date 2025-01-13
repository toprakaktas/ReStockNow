import 'package:flutter/material.dart';

class StepData {
  final String title;
  final Widget content;

  StepData({required this.title, required this.content});
}

List<Step> generateSteps({
  required int currentStep,
  required Function() onSubmit,
}) {
  return [
    Step(
      title: const Text('Step 1: Add Link'),
      content: const TextField(
        decoration: InputDecoration(
          labelText: 'Item Link',
          border: OutlineInputBorder(),
        ),
      ),
      isActive: currentStep >= 0,
    ),
    Step(
      title: const Text('Step 2: Choose Preferences'),
      content: const Text('Size, Color, etc.'),
      isActive: currentStep >= 1,
    ),
    Step(
      title: const Text('Step 3: Notification Methods'),
      content: Column(
        children: [
          CheckboxListTile(
            title: const Text('SMS'),
            value: true,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: const Text('Email'),
            value: false,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: const Text('Push Notifications'),
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
      isActive: currentStep >= 2,
    ),
    Step(
      title: const Text('Step 4: Review & Submit'),
      content: ElevatedButton(
        onPressed: onSubmit,
        child: const Text('Submit'),
      ),
      isActive: currentStep >= 3,
    ),
  ];
}