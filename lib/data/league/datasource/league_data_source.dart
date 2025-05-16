import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class LeagueDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getLeagueCategory() async {
    try {
      return await _firestore.collection('league').get();
    } catch (e) {
      throw Exception('Failed to load.');
    }
  }
}
