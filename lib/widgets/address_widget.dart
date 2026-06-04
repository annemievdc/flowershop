import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController voornaamController;
  final TextEditingController naamController;
  final TextEditingController straatController;
  final TextEditingController huisnummerController;
  final TextEditingController postcodeController;
  final TextEditingController stadController;

  const AddressWidget({
    super.key,
    required this.formKey,
    required this.voornaamController,
    required this.naamController,
    required this.straatController,
    required this.huisnummerController,
    required this.postcodeController,
    required this.stadController,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text("Verzending", style: AppTextStyles.body(context)),

            TextFormField(
              controller: voornaamController,
              style: AppTextStyles.cardbody(context),
              decoration: InputDecoration(
                labelText: "Voornaam",
                labelStyle: AppTextStyles.inputLabel(context),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Voornaam is verplicht";
                }
                return null;
              },
            ),

            TextFormField(
              controller: naamController,
              style: AppTextStyles.cardbody(context),
              decoration: InputDecoration(
                labelText: "Naam",
                labelStyle: AppTextStyles.inputLabel(context),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Naam is verplicht";
                }
                return null;
              },
            ),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: straatController,
                    style: AppTextStyles.cardbody(context),
                    decoration: InputDecoration(
                      labelText: "Straat",
                      labelStyle: AppTextStyles.inputLabel(context),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Straatnaam is verplicht";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: huisnummerController,
                    style: AppTextStyles.cardbody(context),
                    decoration: InputDecoration(
                      labelText: "Huisnummer",
                      labelStyle: AppTextStyles.inputLabel(context),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Huisnummer is verplicht";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: postcodeController,
                    style: AppTextStyles.cardbody(context),
                    decoration: InputDecoration(
                      labelText: "Postcode",
                      labelStyle: AppTextStyles.inputLabel(context),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Postcode is verplicht";
                      }

                      final postcode = int.tryParse(value);

                      if (postcode == null) {
                        return "Postcode moet een nummer zijn";
                      }

                      if (value.length != 4) {
                        return "Belgische postcode moet 4 cijfers hebben";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: stadController,
                    style: AppTextStyles.cardbody(context),
                    decoration: InputDecoration(
                      labelText: "Stad",
                      labelStyle: AppTextStyles.inputLabel(context),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Stad is verplicht";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
