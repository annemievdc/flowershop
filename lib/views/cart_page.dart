import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
              child: ListView.builder(
                itemCount: 12,
                scrollDirection: Axis.vertical,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.green,
                      child: Text("Item vd cart"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
