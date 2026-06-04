import 'package:flowershop/main.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/widgets/app_button.dart';

import 'package:flutter/material.dart';

void betaalSucces(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppTheme.darkSlate,
        title: Center(
          child: Text(
            "Bestelling geplaatst",
            style: AppTextStyles.cardtitle(context),
          ),
        ),

        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 260,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: AppTheme.richBlack,
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/images/addamscar.png',

                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "'Lurch\' is onderweg...",
              style: AppTextStyles.cardtitle(context),
            ),
          ],
        ),

        actions: [
          AppButton(
            onPressed: () {
              Navigator.pop(context); // sluit dialog

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => FlowerApp()),
                (route) => false,
              );
            },
            text: 'Sluiten',
          ),
        ],
      );
    },
  );
}
