import 'package:flowershop/theme/app_text_styles.dart';

import 'package:flutter/material.dart';

class PageTitleBox extends StatelessWidget {
  final String title;

  const PageTitleBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.only(bottom: 16),

        child: Center(
          child: Text(title, style: AppTextStyles.subtitle(context)),
        ),
      ),
    );
  }
}
