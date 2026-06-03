import 'package:flowershop/theme/app_text_styles.dart';

import 'package:flutter/material.dart';

class MailDialoog extends StatefulWidget {
  const MailDialoog({super.key});

  @override
  State<MailDialoog> createState() => _MailDialoogState();
}

class _MailDialoogState extends State<MailDialoog> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(75),
            child: Image.asset(
              'assets/images/lurch.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          TextFormField(
            style: AppTextStyles.cardbody(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Emailadres verplicht";
              }
              return null;
            },
            controller:
                _emailController, // Koppel de controller aan het tekstveld
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'naam@thomasmore.be'),
          ),
        ],
      ),
      title: Text(
        'Voer hier uw e-mailadres in',
        style: AppTextStyles.cardtitle(context),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Annuleer', style: AppTextStyles.cardbody(context)),
        ),
        TextButton(
          onPressed: () {
            String ingevuldEmail = _emailController.text;

            print('Mail versturen naar: $ingevuldEmail');

            // geeft het e-mailadres terug aan het vorige scherm
            Navigator.of(context).pop(ingevuldEmail);
          },
          child: Text('Verstuur', style: AppTextStyles.cardbody(context)),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
