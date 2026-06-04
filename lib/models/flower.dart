class Flower {
  final String id;
  final String name;
  final String scientificName;
  final String imageUrl;
  final double price;
  final bool toxic;
  final String color;
  final int stockQuantity;
  final bool cutflower;

  Flower({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.imageUrl,
    required this.price,
    required this.toxic,
    required this.color,
    required this.stockQuantity,
    required this.cutflower,
  });

  factory Flower.fromFirestore(String id, Map<String, dynamic> data) {
    return Flower(
      id: id,
      name: data['name'] ?? '',
      scientificName: data['scientificName'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      toxic: data['toxic'] ?? false,
      color: data['color'] ?? '',
      stockQuantity: data['stockQuantity'] ?? 0,
      cutflower: data['cutflower'] ?? false,
    );
  }
}
