import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_bump/data/repositories/timeline_repository.dart';
import 'package:safe_bump/domain/entities/pregnancy_details.dart';

class TimelineRepositoryImpl extends TimelineRepository {
  final FirebaseFirestore _firestore;

  TimelineRepositoryImpl(this._firestore);

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