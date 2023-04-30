import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_bump/data/repositories/pregnancy_detail_repository.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';

class PregnancyDetailRepositoryImpl extends PregnancyDetailRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  PregnancyDetailRepositoryImpl(this._firebaseAuth, this._firestore);

  @override
  Future<Void?> addPregnancyDetail(
      int startingDay, double babyHeight, double babyWeight) async {
    try {
      await _firestore
          .collection("Pregnancy Detail")
          .doc(_firebaseAuth.currentUser?.uid)
          .set(PregnancyDetails(startingDay, babyHeight, babyWeight).toJson());
    } on Exception catch (e) {
      return null;
    }
  }
}
