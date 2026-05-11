import 'flower.dart';

class CartItem {
  final Flower flower;
  int quantity;

  CartItem({required this.flower, this.quantity = 1});

  double get totalPricePerItem {
    return flower.price * quantity;
  }
}
