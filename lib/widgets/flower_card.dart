import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/widgets/flower_image.dart';
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
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: SizedBox(
                  width: double.infinity,
                  child: flowerImage(flower.imageUrl),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: double.infinity,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(flower.name, style: AppTextStyles.cardtitle(context)),
                    Text(
                      flower.scientificName,
                      style: AppTextStyles.cardsubtitle(context),
                    ),
                    Text(
                      '${flower.price} €',
                      style: AppTextStyles.cardbodybold(context),
                    ),
                    //----------Ruimte ertussen
                    SizedBox(height: 5),
                    // -----------------AANTAL BLOEMEN------------------------------------------
                    if (quantity > 0)
                      SizedBox(
                        height: 28,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: onRemove,
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  FontAwesomeIcons.circleMinus,
                                  size: 18,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 28,
                              child: Center(
                                child: Text(
                                  '$quantity',
                                  style: AppTextStyles.cardbody(context),
                                ),
                              ),
                            ),

                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: onAdd,
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  FontAwesomeIcons.circlePlus,
                                  size: 18,
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
