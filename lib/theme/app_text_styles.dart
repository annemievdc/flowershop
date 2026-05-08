import 'package:flutter/material.dart';
import 'app_theme.dart';

//titels
class AppTextStyles {
  static TextStyle title(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontWeight: FontWeight.bold,
      fontSize: MediaQuery.of(context).size.width * 0.07,
      color: AppTheme.boneWhite,
      letterSpacing: 1.5,
    );
  }

  static TextStyle subtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: MediaQuery.of(context).size.width * 0.04,
      color: AppTheme.boneWhite,
      letterSpacing: 1.6,
    );
  }

  static TextStyle cardtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: 18,
      color: AppTheme.boneWhite,
      letterSpacing: 0.8,
    );
  }

  static TextStyle cardsubtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: 14,
      fontStyle: FontStyle.normal,
      color: AppTheme.boneWhite,
    );
  }

  //gewone tekst
  static TextStyle body(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: MediaQuery.of(context).size.width * 0.035,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle italic(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: MediaQuery.of(context).size.width * 0.04,
      fontStyle: FontStyle.italic,
      color: AppTheme.boneWhite,
    );
  }
}
