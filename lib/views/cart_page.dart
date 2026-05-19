import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flowershop/widgets/cartitem_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatelessWidget {
  final CartViewModel cartViewModel;

  const CartPage({super.key, required this.cartViewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: cartViewModel,
      builder: (context, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),

                Text(
                  'Jou duistere selectie',
                  style: AppTextStyles.subtitle(context),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: cartViewModel.cart.isEmpty
                      ? Center(
                          child: Text(
                            'Nog geen botanische offers gekozen...',
                            style: AppTextStyles.body(context),
                          ),
                        )
                      : ListView.builder(
                          itemCount: cartViewModel.cart.length,
                          itemBuilder: (context, index) {
                            final item = cartViewModel.cart[index];
                            return Dismissible(
                              key: Key(item.flower.id),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                margin: EdgeInsets.symmetric(vertical: 6),
                                padding: EdgeInsets.only(right: 20),
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(143, 110, 14, 8),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.trash,
                                  size: 16,
                                  color: AppTheme.boneWhite,
                                ),
                              ),
                              onDismissed: (_) {
                                cartViewModel.removeEntireItem(item.flower.id);
                              },
                              child: CartItemCard(item: item),
                            );
                          },
                        ),
                ),

                Card(
                  color: AppTheme.darkSlate,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Totaal', style: AppTextStyles.cardtitle(context)),
                        Text(
                          '${cartViewModel.cartTotalPrice.toStringAsFixed(2)} €',
                          style: AppTextStyles.cardtitle(context),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Card(
                  color: AppTheme.darkSlate,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.featherPointed,
                          color: AppTheme.mutedPurple,
                          size: 20,
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            cartViewModel.selectedMessage?.messagecontent ??
                                "Geen boodschap geselecteerd, kilte is ook een keuze... ",
                            style: AppTextStyles.cardsubtitle(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
