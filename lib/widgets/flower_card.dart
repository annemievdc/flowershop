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
    final bool isSelected = quantity > 0;
    final bool maxReached = quantity >= flower.stockQuantity;
    final bool isOutOfStock = flower.stockQuantity <= 0;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: maxReached || isOutOfStock ? null : onAdd,
      child: Card(
        margin: EdgeInsets.all(4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected
                ? AppTheme.mutedPurple
                : AppTheme.mutedPurple.withOpacity(0.25),
            width: isSelected ? 1.4 : 0.7,
          ),
        ),

        color: AppTheme.darkSlate,
        elevation: isSelected ? 12 : 7,
        shadowColor: AppTheme.mutedPurple,
        clipBehavior: Clip
            .antiAlias, //image blijft netjes binnen de card,geen overhangende hoeken
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned.fill(child: flowerImage(flower.imageUrl)),
                  if (flower.toxic)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppTheme.charcoal,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(FontAwesomeIcons.skull, size: 12),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      flower.name,
                      style: AppTextStyles.cardtitle(context),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    Text(
                      flower.scientificName,
                      style: AppTextStyles.cardsubtitle(context),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),

                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${flower.price.toStringAsFixed(2)} €',
                          style: AppTextStyles.cardbodybold(context),
                        ),
                        SizedBox(width: 10),
                        quantity == 0
                            //toevoegen +
                            ? InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: maxReached || isOutOfStock
                                    ? null
                                    : onAdd,
                                child: Container(
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: AppTheme.mutedPurple,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(FontAwesomeIcons.plus, size: 12),
                                ),
                              )
                            //toevoegen pilvorm met + en -
                            : Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  color: AppTheme.richBlack,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppTheme.mutedPurple,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: onRemove,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 7,
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.minus,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '$quantity',
                                      style: AppTextStyles.cardbody(context),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: maxReached ? null : onAdd,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 7,
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.plus,
                                          size: 12,
                                          color: maxReached
                                              ? AppTheme.stoneGray
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
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
