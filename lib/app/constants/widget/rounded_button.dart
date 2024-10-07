import 'package:flutter/material.dart';
import 'package:mr_task/app/config/theme/app_theme.dart';

class GradientButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  double roundedCorner;

  GradientButton({super.key, required this.text, required this.onPressed, required this.roundedCorner});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        // Remove padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedCorner), // Apply border radius
        ),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.appPrimaryColor, AppTheme.appSecondaryColor],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(roundedCorner), // Apply border radius
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
