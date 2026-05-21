import 'package:flowershop/models/flower.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flowershop/widgets/page_title.dart';
import 'package:flutter/material.dart';
import '../widgets/flower_card.dart';

import 'package:flowershop/services/flower_firestore_service.dart';

class FlowerPage extends StatefulWidget {
  final CartViewModel cartViewModel;

  const FlowerPage({super.key, required this.cartViewModel});

  @override
  State<FlowerPage> createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {
  final FlowerFirestoreService flowerService =
      FlowerFirestoreService(); //ipv the api,gebruik firebase
  late Future<List<Flower>> flowersFuture;

  @override
  void initState() {
    super.initState();
    flowersFuture = flowerService
        .getFlowers(); //getflowers methode uit de firestore service
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: flowersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Stack(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      color: AppTheme.mutedPurple,
                      backgroundColor: AppTheme.darkSlate,
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.darkSlate,
                    backgroundImage: AssetImage('assets/images/skull.png'),
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final flowers = snapshot.data ?? [];

          return Column(
            children: [
              PageTitleBox(title: "Maak een selectie"),
              Expanded(
                child: GridView.builder(
                  itemCount: flowers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //2 per rij
                    crossAxisSpacing: 12, //tussen de kaarten
                    mainAxisSpacing: 12, //tussen de rijen
                    childAspectRatio:
                        0.50, //width : height , hoe kleiner hoe langer de kaart
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
          );
        },
      ),
    );
  }
}
