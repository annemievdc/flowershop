import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppTextStyles {
  static TextStyle title(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: MediaQuery.of(context).size.width * 0.07,
      fontWeight: FontWeight.w800,
      color: AppTheme.boneWhite,
      letterSpacing: 1.3,
    );
  }

  static TextStyle subtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: MediaQuery.of(context).size.width * 0.04,
      fontWeight: FontWeight.w400,
      color: AppTheme.boneWhite,
      letterSpacing: 0.5,
    );
  }

  static TextStyle cardtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: MediaQuery.of(context).size.width * 0.03,
      fontWeight: FontWeight.w600,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle body(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: MediaQuery.of(context).size.width * 0.035,
      fontWeight: FontWeight.w400,
      color: AppTheme.boneWhite,
      height: 1.3,
    );
  }

  static TextStyle italic(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: MediaQuery.of(context).size.width * 0.04,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: AppTheme.boneWhite,
      height: 1.3,
    );
  }
}
