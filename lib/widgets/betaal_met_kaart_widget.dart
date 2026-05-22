import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/widgets/betaalsucces_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void betaalMetKaartDialog(BuildContext context) {
  final kaartFormKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppTheme.darkSlate,
        title: Text("Kaartgegevens"),
        content: Form(
          key: kaartFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kaartnummer verplicht";
                  }

                  if (value.length < 16) {
                    return "Kaartnummer moet 16 cijfers hebben";
                  }
                  return null;
                },
                style: AppTextStyles.cardbody(context),
                decoration: InputDecoration(
                  labelText: "Kaartnummer",
                  labelStyle: AppTextStyles.inputLabel(context),
                ),
              ),
              TextFormField(
                style: AppTextStyles.cardbody(context),
                decoration: InputDecoration(
                  labelText: "Naam op kaart",
                  labelStyle: AppTextStyles.inputLabel(context),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Naam is verplicht";
                  }
                  return null;
                },
              ),

              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: AppTextStyles.cardbody(context),
                decoration: InputDecoration(
                  labelText: "Vervaldatum",
                  labelStyle: AppTextStyles.inputLabel(context),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vervaldatum verplict";
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: AppTextStyles.cardbody(context),
                decoration: InputDecoration(
                  labelText: "CVC",
                  labelStyle: AppTextStyles.inputLabel(context),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "CVC verplict";
                  }
                  if (value.length != 3) {
                    return "CVC moet 3 cijfers hebben";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppTheme.darkSlate,
              foregroundColor: AppTheme.boneWhite,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text("Annuleren"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.driedBlood,
              foregroundColor: AppTheme.boneWhite,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (!kaartFormKey.currentState!.validate()) {
                return;
              }
              Navigator.pop(context);
              betaalSucces(context);
            },
            child: Text("Bevestigen"),
          ),
        ],
      );
    },
  );
}
