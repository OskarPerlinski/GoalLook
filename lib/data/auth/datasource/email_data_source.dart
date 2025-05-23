import 'package:firebase_auth/firebase_auth.dart';
import 'package:goallook/domain/auth/auth_exception/auth_exception.dart';
import 'package:injectable/injectable.dart';

@singleton
class EmailDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> getSignUpWithEmail(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    }
  }

  Future<UserCredential> getSignIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    }
  }
}
