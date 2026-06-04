import 'package:flowershop/services/local_storage_service.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
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

  final _shippingFormKey = GlobalKey<FormState>();
  final LocalStorageService localStorageService = LocalStorageService();
  final TextEditingController voornaamController = TextEditingController();
  final TextEditingController naamController = TextEditingController();
  final TextEditingController straatController = TextEditingController();
  final TextEditingController huisnummerController = TextEditingController();
  final TextEditingController postcodeController = TextEditingController();
  final TextEditingController stadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadAdres();
  }

  @override
  Widget build(BuildContext context) {
    final opties = <DropdownMenuItem<String>>[
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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              PageTitleBox(title: "Afrekenen"),

              const SizedBox(height: 16),

              Card(
                color: AppTheme.darkSlate,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Bestellingsoverzicht",
                        style: AppTextStyles.cardtitle(context),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),

                      ...widget.cartViewModel.cart.map((item) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            item.flower.name,
                            style: AppTextStyles.body(context),
                          ),
                          subtitle: Text(
                            "Aantal: ${item.quantity}",
                            style: AppTextStyles.body(context),
                          ),
                          trailing: Text(
                            "${(item.flower.price * item.quantity).toStringAsFixed(2)} €",
                            style: AppTextStyles.body(context),
                          ),
                        );
                      }),

                      const Divider(color: AppTheme.mutedPurple, height: 24),

                      Row(
                        children: [
                          Text(
                            "Totaal",
                            style: AppTextStyles.cardtitle(context),
                          ),

                          const Spacer(),

                          Flexible(
                            child: Text(
                              "${widget.cartViewModel.cartTotalPrice.toStringAsFixed(2)} €",
                              style: AppTextStyles.cardtitle(context),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              AddressWidget(
                formKey: _shippingFormKey,
                voornaamController: voornaamController,
                naamController: naamController,
                straatController: straatController,
                huisnummerController: huisnummerController,
                postcodeController: postcodeController,
                stadController: stadController,
              ),

              const SizedBox(height: 16),

              BetaalWidget(
                totalPrice: widget.cartViewModel.cartTotalPrice,
                opties: opties,
                betaalwijze: betaalwijze,
                onBetaalWijzeChanged: (value) {
                  setState(() {
                    betaalwijze = value;
                  });
                },
                onPayPressed: () async {
                  if (!_shippingFormKey.currentState!.validate()) {
                    return;
                  }

                  if (betaalwijze == null) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: AppTheme.darkSlate,
                        title: Text(
                          "Geen betaalmethode gekozen",
                          style: AppTextStyles.cardbody(context),
                        ),
                      ),
                    );
                    return;
                  }

                  await saveAdres();
                  if (betaalwijze == 'visa' || betaalwijze == 'mastercard') {
                    betaalMetKaartDialog(context);
                  } else {
                    betaalSucces(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveAdres() async {
    await localStorageService.saveString("voornaam", voornaamController.text);
    await localStorageService.saveString("naam", naamController.text);
    await localStorageService.saveString("straat", straatController.text);
    await localStorageService.saveString(
      "huisnummer",
      huisnummerController.text,
    );
    await localStorageService.saveString("postcode", postcodeController.text);
    await localStorageService.saveString("stad", stadController.text);
  }

  void loadAdres() async {
    voornaamController.text = await localStorageService.loadString("voornaam");
    naamController.text = await localStorageService.loadString("naam");
    straatController.text = await localStorageService.loadString("straat");
    huisnummerController.text = await localStorageService.loadString(
      "huisnummer",
    );
    postcodeController.text = await localStorageService.loadString("postcode");
    stadController.text = await localStorageService.loadString("stad");
  }

  @override
  void dispose() {
    voornaamController.dispose();
    naamController.dispose();
    straatController.dispose();
    huisnummerController.dispose();
    postcodeController.dispose();
    stadController.dispose();

    super.dispose();
  }
}
