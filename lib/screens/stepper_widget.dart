import 'package:flutter/material.dart';
import 'package:restocknow/utils/notification_preferences.dart';
import 'package:restocknow/utils/step_data.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  final NotificationPreferences _preferences = NotificationPreferences();
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep < 3) {
          setState(() {
            _currentStep += 1;
          });
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep -= 1;
          });
        }
      },
      steps: generateSteps(
    currentStep: _currentStep,
    onSubmit: () {
     print('Preferences: $_preferences');
    },
      ),
    );
  }
}
