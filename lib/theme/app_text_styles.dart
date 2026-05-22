import 'package:flutter/material.dart';
import 'app_theme.dart';

//titels
class AppTextStyles {
  static TextStyle title(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontWeight: FontWeight.bold,
      fontSize: MediaQuery.of(context).size.width * 0.06,
      color: AppTheme.boneWhite,
      letterSpacing: 3,
    );
  }

  static TextStyle subtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: MediaQuery.of(context).size.width * 0.04,
      color: AppTheme.boneWhite,
      letterSpacing: 1.5,
    );
  }

  //gewone tekst
  static TextStyle body(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 20,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle italic(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 18,
      fontStyle: FontStyle.italic,
      color: AppTheme.boneWhite,
    );
  }

  //cards
  static TextStyle cardtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle cardsubtitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 16,
      fontStyle: FontStyle.italic,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle cardbodybold(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle cardbody(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle cardbodyboldsmall(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle cardbodysmall(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle inputLabel(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 18,
      color: AppTheme.boneWhite,
    );
  }

  static TextStyle inputHint(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cormorant',
      fontSize: 18,
      fontStyle: FontStyle.italic,
      color: AppTheme.boneWhite,
    );
  }
}
