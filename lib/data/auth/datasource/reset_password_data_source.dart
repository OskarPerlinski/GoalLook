import 'package:firebase_auth/firebase_auth.dart';
import 'package:goallook/domain/auth/auth_exception/auth_exception.dart';
import 'package:injectable/injectable.dart';

@singleton
class ResetPasswordDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    }
  }
}
