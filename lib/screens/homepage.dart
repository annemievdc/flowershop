import 'package:flutter/material.dart';

import '../data/flower_data.dart';
import '../theme/app_text_styles.dart';
import '../widgets/flower_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botanica Obscura', style: AppTextStyles.title(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Onheilspellend Elegant',
                style: AppTextStyles.subtitle(context),
                maxLines: 1,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                itemCount: flowers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12, //tussen de kaarten
                  mainAxisSpacing: 12, //tussen de rijen
                  childAspectRatio: 0.75, //width : height
                ),
                itemBuilder: (context, index) {
                  final flower = flowers[index];

                  return FlowerCard(flower: flower);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
