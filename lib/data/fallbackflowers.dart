import 'package:flowershop/models/flower.dart';

final List<Flower> fallbackflowers = [
  Flower(
    id: 1,
    name: 'Zwarte Roos',
    scientificName: 'Rosa Noir',
    imageUrl: 'assets/images/zwarteroos.jpg',
    price: 2.0,
    toxic: false,
  ),
  Flower(
    id: 2,
    name: 'Dahlia Black Jack',
    scientificName: 'Dahlia Black Jack',
    imageUrl: 'assets/images/dahliablackjack.jpg',
    price: 3.2,
    toxic: false,
  ),
  Flower(
    id: 3,
    name: 'Calla Black Star',
    scientificName: 'Zantedeschia',
    imageUrl: 'assets/images/callablackstar.jpg',
    price: 2.55,
    toxic: true,
  ),
];
