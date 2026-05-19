import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowershop/models/flower.dart';

class FlowerFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Flower>> getFlowers() async {
    final snapshot = await _db.collection('flowers').get();

    return snapshot.docs.map((doc) {
      return Flower.fromFirestore(doc.id, doc.data());
    }).toList();
  }
}
