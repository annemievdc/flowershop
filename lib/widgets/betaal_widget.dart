import 'package:flowershop/theme/app_text_styles.dart';

import 'package:flowershop/widgets/app_button.dart';
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
          SizedBox(height: 16),
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
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: AppButton(onPressed: onPayPressed, text: "Betalen"),
          ),
        ],
      ),
    );
  }
}
