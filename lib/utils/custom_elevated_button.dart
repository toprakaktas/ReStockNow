import 'package:flutter/material.dart';

import 'colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed
});

  @override
  Widget build(BuildContext context) {
    final isCancel = text == 'Back' || text == 'Cancel';
    final gradientColors =
      isCancel ? [backButton, backButton2] : [ lightButton, blueButton ];
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.8)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 8.5),
          alignment: Alignment.center,
          child: Text(
            text,
              style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              )
          ),
        ),
      ),
    );
  }
}