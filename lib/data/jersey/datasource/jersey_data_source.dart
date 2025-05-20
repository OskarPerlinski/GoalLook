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

  Future<QuerySnapshot> getTopSellings() async {
    try {
      return await _firestore
          .collection('jersey')
          .orderBy('sold', descending: true)
          .limit(10)
          .get();
    } catch (e) {
      throw Exception('Failed to load.');
    }
  }

  Future<QuerySnapshot> getJerseyByCollectionsId(String leagueId) async {
    try {
      return await _firestore
          .collection('jersey')
          .where('leagueId', isEqualTo: leagueId)
          .get();
    } catch (e) {
      throw Exception('Failed to load.');
    }
  }
}
