import 'package:flowershop/models/cart_item.dart';
import 'package:flowershop/models/message.dart';
import 'package:flutter/material.dart';

import '../models/flower.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItem> cart = [];
  Message? selectedMessage;

  void addFlower(Flower flower) {
    //zoek waar de bloem met id x in de lijst zit, vergelijk op id.
    final index = cart.indexWhere((item) => item.flower.id == flower.id);
    if (index == -1) //-1 is niks gevonden...
    {
      if (flower.stockQuantity > 0) {
        cart.add(CartItem(flower: flower));
        notifyListeners();
      }
      return;
    }
    if (cart[index].quantity < flower.stockQuantity) {
      cart[index].quantity++;
      notifyListeners();
    }
  }

  void removeFlower(Flower flower) {
    final index = cart.indexWhere((item) => item.flower.id == flower.id);
    if (index == -1) return; //doe niks

    if (cart[index].quantity > 1) {
      cart[index].quantity--;
    } else {
      cart.removeAt(index);
    }
    notifyListeners();
  }

  int quantityFor(Flower flower) {
    final index = cart.indexWhere((item) => item.flower.id == flower.id);
    if (index == -1) return 0;
    return cart[index].quantity;
  }

  double get cartTotalPrice {
    double cartTotalPrice = 0;
    for (final item in cart) {
      cartTotalPrice += item.totalPricePerItem;
    }
    return cartTotalPrice;
  }

  void addMessage(Message message) {
    selectedMessage = message;
    notifyListeners();
  }

  void removeEntireItem(String id) {
    cart.removeWhere((item) => item.flower.id == id);
    notifyListeners();
  }
}
