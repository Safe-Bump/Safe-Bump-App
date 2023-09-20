import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_bump/data/repositories/dashboard_repository.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';

import '../entities/user_model.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  DashboardRepositoryImpl(this._firebaseAuth, this._firestore);

  @override
  Future<UserModel?> getUserDetails() async {
    try {
      var user = await _firestore
          .collection("User")
          .doc(_firebaseAuth.currentUser?.uid)
          .get();
      if (user.data() != null) {
        return UserModel.fromJson(user.data()!);
      } else {
        return null; // Handle the case when data is null.
      }
    } on Exception {
      return null;
    }
  }

  @override
  Future<PregnancyDetails?> getPregnancyDetails() async {
    try {
      var pregnancyDetails = await _firestore
          .collection("Pregnancy Detail")
          .doc(_firebaseAuth.currentUser?.uid)
          .get();
      if (pregnancyDetails.data() != null) {
        return PregnancyDetails.fromJson(pregnancyDetails.data()!);
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }
}
