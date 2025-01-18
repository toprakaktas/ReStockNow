import 'package:flutter/material.dart';
import 'package:restocknow/utils/custom_elevated_button.dart';

class StepperControls extends StatelessWidget {
  final int currentStep;
  final bool isLastStep;
  final ControlsDetails details;
  final VoidCallback goToStep1;

  const StepperControls({
    super.key,
    required this.currentStep,
    required this.isLastStep,
    required this.details,
    required this.goToStep1,
  });

  @override
  Widget build(BuildContext context) {
    final String textContinue = (isLastStep ? 'Submit' : 'Continue');
    final String textCancel = (currentStep > 0 && !isLastStep ? 'Back' : 'Cancel');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomElevatedButton(
            text: textContinue,
            onPressed: details.onStepContinue ?? () {},
        ),
        if (currentStep > 0)
          CustomElevatedButton(
              text: textCancel,
              onPressed: () {
                if (isLastStep) {
                  goToStep1(); // Navigate to step 1 if on the last step.
                } else {
                  details.onStepCancel?.call();
                }
        })
      ],
    );
  }
}