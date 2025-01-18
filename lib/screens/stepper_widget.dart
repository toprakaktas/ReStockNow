import 'package:flutter/material.dart';
import 'package:restocknow/usecases/handle_submit.dart';
import 'package:restocknow/utils/step_data.dart';

import '../utils/stepper_controls.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  void _goToStep1() {
    if (_currentStep != 0) {
      setState(() {
        _currentStep = 0; // Reset to Step 1
      });
    }
  }

  void _nextStep() {
    setState(() {
      _currentStep += 1;
    });
  }

  void _previousStep() {
    setState(() {
      _currentStep -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepTapped: (int index){
        setState(() {
          _currentStep = index;
        });
      },
      onStepContinue: () {
        if (_currentStep < 3) {
          _nextStep();
        }
        else {
          HandleSubmitUseCase().call();
        }
      },
      onStepCancel: () {
        if (_currentStep == 3) {
           _goToStep1();
        } else if (_currentStep > 0) {
          _previousStep();
        }
      },
      controlsBuilder: (context, details) {
        return StepperControls(
          currentStep: _currentStep,
          isLastStep: _currentStep == 3,
          details: details,
          goToStep1: _goToStep1,
        );
      },
      steps: generateSteps(
        currentStep: _currentStep,
        onSubmit: () {
          HandleSubmitUseCase().call();
    },
      ),
    );
  }
}
