import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class JerseyDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getNewJersey() async {
    try {
      return await _firestore
          .collection('jersey')
          .orderBy('createdAt', descending: true)
          .limit(10)
          .get();
    } catch (e) {
      throw Exception('Failed to load.');
    }
  }
}
