import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/flower.dart';

class FlowerCard extends StatelessWidget {
  final Flower flower;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const FlowerCard({
    super.key,
    required this.flower,
    this.quantity = 0,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onAdd,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        color: AppTheme.darkSlate,
        elevation: 10,
        shadowColor: AppTheme.mutedPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(flower.imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      flower.commonName,
                      style: AppTextStyles.cardtitle(context),
                    ),
                    Text(
                      flower.scientificName,
                      style: AppTextStyles.cardsubtitle(context),
                    ),
                    Text(
                      '${flower.price} €',
                      style: AppTextStyles.italic(context),
                    ),
                    SizedBox(height: 10),
                    // -----------------AANTAL BLOEMEN------------------------------------------
                    if (quantity > 0)
                      SizedBox(
                        height: 20,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: onRemove,

                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  FontAwesomeIcons.circleMinus,
                                  size: 16,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),

                              child: Text(
                                '$quantity',
                                style: AppTextStyles.cardsubtitle(context),
                              ),
                            ),

                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: onAdd,

                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  FontAwesomeIcons.circlePlus,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
