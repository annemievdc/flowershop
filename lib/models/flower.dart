/* enum FlowerColor { zwart, donkerrood, oranje, paars, rood, wit, blauw }

class Flower {
  final String id;
  final String commonName;
  final String scientificName;
  final String imageUrl;
  final double price;
  final Enum FlowerColor;
  final bool poisonous;

  Flower(
    this.id,
    this.commonName,
    this.scientificName,
    this.imageUrl,
    this.price,
    this.FlowerColor,
    this.poisonous,
  );
}
 */

class Flower {
  final int id;
  final String name;
  late final String scientificName;
  final String imageUrl;
  final double price;
  final bool toxic;

  Flower({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.imageUrl,
    required this.price,
    required this.toxic,
  });

  factory Flower.fromJson(Map<String, dynamic> json) {
    return Flower(
      id: json['id'] ?? 0,
      name: json['common_name'] ?? json['scientific_name'],
      /* als er geen gewone naam is neem de wetenschappelijke naam */
      scientificName: json['scientific_name'],
      imageUrl: json['image_url'] ?? 'assets/images/fallback.jpg',
      price: (json['price'] ?? 2.5).toDouble(), //aan te passen
      toxic: json['toxic'] ?? false, //aan te passen !
    );
  }
}
