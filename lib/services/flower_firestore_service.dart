import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowershop/models/flower.dart';

class FlowerFirestoreService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Flower>> getFlowers() async {
    final snapshot = await db.collection('flowers').get();

    return snapshot.docs.map((doc) {
      return Flower.fromFirestore(doc.id, doc.data());
    }).toList();
  }
}
