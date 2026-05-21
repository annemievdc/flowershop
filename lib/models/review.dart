class Review {
  final String id;
  final String content;
  final String? author;

  Review({required this.id, required this.content, this.author});

  String get displayAuthor => author ?? 'Anoniem';
}
