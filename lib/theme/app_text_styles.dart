import 'package:flutter/material.dart';
import 'app_theme.dart';

//titels
class AppTextStyles {
  static TextStyle title(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontWeight: FontWeight.bold,
      fontSize: MediaQuery.of(context).size.width * 0.08,
      color: AppTheme.boneWhite,
      letterSpacing: 2.5,
    );
  }

  static TextStyle subtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: MediaQuery.of(context).size.width * 0.06,
      color: AppTheme.boneWhite,
    );
  }

  //gewone tekst
  static TextStyle body(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 29,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle italic(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 16,
      fontStyle: FontStyle.italic,
      color: AppTheme.boneWhite,
    );
  }

  //cards
  static TextStyle cardtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppTheme.boneWhite,
      letterSpacing: 0.8,
    );
  }

  static TextStyle cardsubtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',

      fontSize: 22,
      fontStyle: FontStyle.italic,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle cardbodybold(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle cardbody(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: AppTheme.boneWhite,
    );
  }
}
