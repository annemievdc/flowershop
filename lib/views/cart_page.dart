import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flowershop/widgets/cartitem_card.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final CartViewModel cartViewModel;
  const CartPage({super.key, required this.cartViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Selectie',
                  style: AppTextStyles.subtitle(context),
                  maxLines: 1,
                ),
              ),
            ),
            Expanded(
              child: cartViewModel.cart.isEmpty
                  ? Center(
                      child: Text(
                        'Nog geen botanische offers gekozen...',
                        style: AppTextStyles.body(context),
                      ),
                    ) //als leeg
                  : ListView.builder(
                      //en anders doe build listview
                      itemCount: cartViewModel.cart.length + 1,
                      itemBuilder: (context, index) {
                        if (index == cartViewModel.cart.length) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Totaal : ',
                                  style: AppTextStyles.cardtitle(context),
                                ),
                                Text(
                                  '${cartViewModel.cartTotalPrice.toStringAsFixed(2)} €',
                                  style: AppTextStyles.cardtitle(context),
                                ),
                              ],
                            ),
                          );
                        }
                        final item = cartViewModel.cart[index];
                        return CartItemCard(item: item);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
