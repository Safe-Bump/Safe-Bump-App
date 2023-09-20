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
      // Check if pregnancyDetails.data() is not null before accessing it.
      if (pregnancyDetails.data() != null) {
        return PregnancyDetails.fromJson(pregnancyDetails.data()!);
      } else {
        return null; // Handle the case when data is null.
      }
    } on Exception {
      return null;
    }
  }
}
