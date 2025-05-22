import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class BagDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addJerseyToBag(Map<String, dynamic> data) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('bag')
          .add(data);
    } catch (e) {
      throw Exception('Failed to add to bag');
    }
  }

  Future<QuerySnapshot> getBagProducts() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }
      return await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('bag')
          .get();
    } catch (e) {
      throw Exception('Failed to load bag.');
    }
  }

  Future<void> removeBagProducts(String id) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('bag')
          .doc(id)
          .delete();
    } catch (e) {
      throw Exception('Failed to remove jersey.');
    }
  }
}
