import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_bump/data/repositories/db_repository.dart';

class FirestoreRepository implements DbRepository{
  final FirebaseFirestore firestore;
  FirestoreRepository(this.firestore);


}