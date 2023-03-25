import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/login_repository.dart';

@injectable
class FirebaseAuthRepository implements LoginRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthRepository(this._firebaseAuth, this._googleSignIn);

  @override
  Future<UserCredential?> login(String? email, String? password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        if (kDebugMode) {
          print(e);
        }
      }
      return null;
    }
  }

  @override
  Future<UserCredential?> googleLogin() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        if (kDebugMode) {
          print(e);
        }
      }
      return null;
    }
  }

  @override
  Future<UserCredential?> signUp(String? email, String? password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        if (kDebugMode) {
          print(e);
        }
      }
      return null;
    }
  }
}
