import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_bump/data/repositories/timeline_repository.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';

class TimelineRepositoryImpl extends TimelineRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  TimelineRepositoryImpl(this._firestore, this._firebaseAuth);

  @override
  Future<PregnancyDetails?> getPregnancyDetails() async {
    try {
      var pregnancyDetails = await _firestore
          .collection("Pregnancy Detail")
          .doc(_firebaseAuth.currentUser?.uid)
          .get();
      return PregnancyDetails.fromJson(pregnancyDetails.data()!);
    } on Exception catch (e) {
      return null;
    }
  }
}
