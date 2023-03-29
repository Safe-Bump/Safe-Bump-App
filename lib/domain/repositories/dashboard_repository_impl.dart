import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
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
          .doc("DlmyxsohA5Uo4HhVEwHYC9DJ6sC2")
          .get();

      return UserModel.fromJson(user.data()!);
    } on Exception catch (e) {
      return null;
    }
  }

  @override
  Future<PregnancyDetails?> getPregnancyDetails() async {
    try {
      var pregnancyDetails = await _firestore
          .collection("Pregnancy Detail")
          .doc("DlmyxsohA5Uo4HhVEwHYC9DJ6sC2")
          .get();
      return PregnancyDetails.fromJson(pregnancyDetails.data()!);
    } on Exception catch (e) {
      return null;
    }
  }
}
