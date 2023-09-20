// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:safe_bump/domain/entities/user_model.dart';

import '../../data/repositories/login_repository.dart';
import '../../navigation/router.dart';

class FirebaseAuthRepository implements LoginRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthRepository(
      this._firebaseAuth, this._googleSignIn, this._firestore);

  @override
  Future<UserCredential?> login(String? email, String? password, BuildContext context) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        NavigationRoutes.mainScreen,
        (route) => false,
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
      var userCredential = await _firebaseAuth.signInWithCredential(credential);
      _firestore.collection("User").doc(userCredential.user?.uid).set(
        UserModel(
          userCredential.user?.displayName, userCredential.user?.email, "", userCredential.user?.photoURL)
          .toJson()
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
  Future<UserCredential?> signUp(UserModel? user, BuildContext context) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user!.email!,
        password: user.password!,
      );
      await _firestore.collection("User").doc(userCredential.user?.uid).set(
        user.toJson()
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        NavigationRoutes.mainScreen,
        (route) => false,
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
