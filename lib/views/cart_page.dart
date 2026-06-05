import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/viewmodels/cart_view_model.dart';

import 'package:flowershop/widgets/app_button.dart';
import 'package:flowershop/widgets/cartitem_card.dart';
import 'package:flowershop/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatelessWidget {
  final CartViewModel cartViewModel;

  const CartPage({super.key, required this.cartViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: cartViewModel,
          builder: (context, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  PageTitleBox(title: "Uw duistere selectie"),
                  const SizedBox(height: 12),
                  cartViewModel.cart.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: Center(
                            child: Text(
                              'Nog geen botanische offers gekozen...',
                              style: AppTextStyles.body(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            ...cartViewModel.cart.map((item) {
                              return Dismissible(
                                key: Key(item.flower.id),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  padding: const EdgeInsets.only(right: 12),
                                  alignment: Alignment.centerRight,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      143,
                                      110,
                                      14,
                                      8,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    FontAwesomeIcons.trash,
                                    size: 16,
                                    color: AppTheme.boneWhite,
                                  ),
                                ),
                                onDismissed: (_) {
                                  cartViewModel.removeEntireItem(
                                    item.flower.id,
                                  );
                                },
                                child: CartItemCard(item: item),
                              );
                            }),
                          ],
                        ),
                  const SizedBox(height: 20),
                  Card(
                    color: AppTheme.darkSlate,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
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
                  Card(
                    color: AppTheme.darkSlate,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Totaal',
                            style: AppTextStyles.cardtitle(context),
                          ),
                          const Spacer(),
                          Text(
                            '${cartViewModel.cartTotalPrice.toStringAsFixed(2)} €',
                            style: AppTextStyles.cardtitle(context),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,

                    child: AppButton(
                      onPressed: () {
                        DefaultTabController.of(context).animateTo(4);
                      },

                      text: 'Verder naar betaling',
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
