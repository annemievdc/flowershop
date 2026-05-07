import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../models/flower.dart';

class FlowerCard extends StatelessWidget {
  final Flower flower;
  const FlowerCard({super.key, required this.flower});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.darkSlate,
      shadowColor: AppTheme.stoneGray,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      clipBehavior:
          Clip.antiAlias, //snijdt de foto af om in de widget te passen

      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              height: 300,
              width: double.infinity,
              flower.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  flower.commonName,
                  style: AppTextStyles.cardtitle(context),
                ),
                Text(flower.scientificName, style: AppTextStyles.body(context)),
                Text('€${flower.price}', style: AppTextStyles.italic(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
