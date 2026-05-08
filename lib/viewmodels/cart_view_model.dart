import 'package:flowershop/models/cart_item.dart';

import '../models/flower.dart';

class CartViewModel {
  final List<CartItem> cart = [];

  void addFlower(Flower flower) {
    //zoek waar de bloem met id x in de lijst zit, vergelijk op id.
    final index = cart.indexWhere((item) => item.flower.id == flower.id);
    if (index == -1) //-1 is niks gevonden...
    {
      cart.add(CartItem(flower: flower));
    } else {
      cart[index].quantity++;
    }
  }

  void removeFlower(Flower flower) {
    final index = cart.indexWhere((item) => item.flower.id == flower.id);
    if (index == -1)
      return; //doe niks
    else {
      cart.removeAt(index);
    }
  }

  int quantityFor(Flower flower) {
    final index = cart.indexWhere((item) => item.flower.id == flower.id);
    if (index == -1) return 0;
    return cart[index].quantity;
  }
}
