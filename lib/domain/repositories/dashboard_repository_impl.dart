import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/data/repositories/dashboard_repository.dart';
import 'package:safe_bump/domain/entities/User.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';

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

      // return UserModel.fromJson(user.data()!);
    } on Exception catch (e) {
      return null;
    }
  }

  @override
  Future<PregnancyDetails?> getPregnancyDetails() async {
    try {
      var pregnancyDetails = await _firestore
          .collection("Pregnancy Details")
          .doc(_firebaseAuth.currentUser?.uid)
          .get();

      // return PregnancyDetails.fromJson(pregnancyDetails.data()!);
    } on Exception catch (e) {
      return null;
    }
  }
}
