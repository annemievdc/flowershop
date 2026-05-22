import 'package:flowershop/theme/app_text_styles.dart';

import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flowershop/widgets/address_widget.dart';
import 'package:flowershop/widgets/betaal_widget.dart';
import 'package:flowershop/widgets/betaal_met_kaart_widget.dart';
import 'package:flowershop/widgets/betaalsucces_widget.dart';
import 'package:flowershop/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentPage extends StatefulWidget {
  final CartViewModel cartViewModel;

  const PaymentPage({super.key, required this.cartViewModel});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? betaalwijze;

  late final List<DropdownMenuItem<String>> opties = <DropdownMenuItem<String>>[
    DropdownMenuItem(
      value: 'mastercard',
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.creditCard),
          const SizedBox(width: 16),
          Text('Mastercard', style: AppTextStyles.body(context)),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'visa',
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.creditCard),
          const SizedBox(width: 16),
          Text('Visa', style: AppTextStyles.body(context)),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'googlepay',
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.googlePay),
          const SizedBox(width: 16),
          Text('GooglePay', style: AppTextStyles.body(context)),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'paypal',
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.paypal),
          const SizedBox(width: 16),
          Text('PayPal', style: AppTextStyles.body(context)),
        ],
      ),
    ),
  ];
  final _shippingFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            PageTitleBox(title: "Afrekenen"),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            "Bestellingsoverzicht",
                            style: AppTextStyles.body(context),
                          ),
                        ),
                        //
                        ...widget.cartViewModel.cart.map((item) {
                          return ListTile(
                            title: Text(
                              item.flower.name,
                              style: AppTextStyles.body(context),
                            ),
                            subtitle: Text(
                              "Aantal : ${item.quantity}",
                              style: AppTextStyles.body(context),
                            ),
                            trailing: Text(
                              "${(item.flower.price * item.quantity).toStringAsFixed(2)} €",
                              style: AppTextStyles.body(context),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //adres widget
            Expanded(flex: 5, child: AddressWidget(formKey: _shippingFormKey)),
            //betaal widget
            Expanded(
              flex: 3,
              child: BetaalWidget(
                totalPrice: widget.cartViewModel.cartTotalPrice,
                opties: opties,
                betaalwijze: betaalwijze,
                onBetaalWijzeChanged: (value) {
                  setState(() {
                    betaalwijze = value;
                  });
                },
                onPayPressed: () {
                  if (!_shippingFormKey.currentState!.validate()) {
                    return;
                  }
                  if (betaalwijze == null) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          "Geen betaalmethode gekozen",
                          style: AppTextStyles.cardbody(context),
                        ),
                      ),
                    );
                    return;
                  }
                  if (betaalwijze == 'visa' || betaalwijze == 'mastercard') {
                    betaalMetKaartDialog(context);
                  } else {
                    betaalSucces(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
