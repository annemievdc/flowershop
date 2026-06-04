import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.darkSlate,
        foregroundColor: AppTheme.boneWhite,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      onPressed: onPressed,
      child: Text(text, style: AppTextStyles.cardbody(context)),
    );
  }
}
