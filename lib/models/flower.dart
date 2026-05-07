enum FlowerColor { zwart, donkerrood, oranje, paars, rood, wit, blauw }

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
