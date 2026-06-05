import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/widgets/app_button.dart';

import 'package:flutter/material.dart';

class MailDialoog extends StatefulWidget {
  const MailDialoog({super.key});

  @override
  State<MailDialoog> createState() => _MailDialoogState();
}

class _MailDialoogState extends State<MailDialoog> {
  final TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>(); //nodig voor validator

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppTheme.darkSlate,
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Image.asset(
                'assets/images/lurch.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Vul hieronder je emailadres in : ',
              style: AppTextStyles.cardbody(context),
            ),
            SizedBox(height: 3),
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
      ),
      title: Text(
        'You Raaaang ? \n Lurch beantwoord uw vragen',
        style: AppTextStyles.cardtitle(context),
        textAlign: TextAlign.center,
      ),
      actions: [
        AppButton(
          onPressed: () => Navigator.of(context).pop(),
          text: 'Annuleer',
        ),
        AppButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              String ingevuldEmail = _emailController.text;

              print('Mail versturen naar: $ingevuldEmail');

              // geeft het e-mailadres terug aan het vorige scherm
              Navigator.of(context).pop(ingevuldEmail);
            }
          },
          text: 'Verstuur',
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
