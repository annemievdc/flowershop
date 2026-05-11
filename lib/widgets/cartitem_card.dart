import 'package:flowershop/models/cart_item.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(item.flower.imageUrl),
              minRadius: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Text(
                    item.flower.commonName,
                    style: AppTextStyles.cardsubtitle(context),
                  ),
                  Text(
                    'Per stuk : ${item.flower.price} €',
                    style: AppTextStyles.cardbody(context),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  ' x ${item.quantity}',
                  style: AppTextStyles.cardbody(context),
                ),
                Text(
                  'Subtotaal : ${(item.totalPricePerItem.toStringAsFixed(2))} €',
                  style: AppTextStyles.cardbodybold(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
