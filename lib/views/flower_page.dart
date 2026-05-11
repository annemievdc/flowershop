import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flutter/material.dart';

import '../data/flower_data.dart';
import '../theme/app_text_styles.dart';
import '../widgets/flower_card.dart';

class FlowerPage extends StatefulWidget {
  final CartViewModel cartViewModel;

  const FlowerPage({super.key, required this.cartViewModel});

  @override
  State<FlowerPage> createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {
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
                  'Onheilspellend Elegant',
                  style: AppTextStyles.subtitle(context),
                  maxLines: 1,
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: flowers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //2 per rij
                  crossAxisSpacing: 12, //tussen de kaarten
                  mainAxisSpacing: 12, //tussen de rijen
                  childAspectRatio:
                      0.66, //width : height , hoe kleiner hoe langer de kaart
                ),
                itemBuilder: (context, index) {
                  final flower = flowers[index];

                  return FlowerCard(
                    flower: flower,
                    quantity: widget.cartViewModel.quantityFor(flower),
                    onAdd: () {
                      setState(() {
                        widget.cartViewModel.addFlower(flower);
                      });
                    },
                    onRemove: () {
                      setState(() {
                        widget.cartViewModel.removeFlower(flower);
                      });
                    },
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
