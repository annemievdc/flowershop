import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BetaalWidget extends StatelessWidget {
  final double totalPrice;
  final List<DropdownMenuItem<String>> opties;
  final String? betaalwijze;
  final Function(String?) onBetaalWijzeChanged;
  final VoidCallback onPayPressed;
  const BetaalWidget({
    super.key,
    required this.totalPrice,
    required this.opties,
    required this.betaalwijze,
    required this.onBetaalWijzeChanged,
    required this.onPayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Totaal : ${totalPrice.toStringAsFixed(2)} €",
            style: AppTextStyles.body(context),
          ),

          DropdownButtonFormField<String>(
            items: opties,
            style: AppTextStyles.body(context),
            decoration: InputDecoration(
              labelText: "Betaalmethode",
              labelStyle: AppTextStyles.inputLabel(context),
              border: const OutlineInputBorder(),
            ),
            onChanged: onBetaalWijzeChanged,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.darkSlate,
                foregroundColor: AppTheme.boneWhite,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: onPayPressed,
              child: Text("Betalen", style: AppTextStyles.body(context)),
            ),
          ),
        ],
      ),
    );
  }
}
