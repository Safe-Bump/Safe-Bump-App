import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_bump/data/repositories/calendar_repository.dart';
import 'package:safe_bump/domain/entities/calendar_notes_model.dart';

class CalendarRepositoryImpl extends CalendarRepository {
  final FirebaseFirestore _firestore;

  CalendarRepositoryImpl(this._firestore);

  @override
  Future<CalendarNotesModel?> getCalendarNotes() async {
    try {
      var notes = await _firestore
          .collection("Calendar Notes")
          .doc("DlmyxsohA5Uo4HhVEwHYC9DJ6sC2")
          .get();
      return CalendarNotesModel.fromJson(notes.data()!);
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> addNotes(DateTime? selectedDate, List<String>? notesList) async {
    try {
      await _firestore
          .collection("Calendar Notes")
          .doc("DlmyxsohA5Uo4HhVEwHYC9DJ6sC2")
          .update({
        'notes.${((selectedDate?.millisecondsSinceEpoch)! ~/ (24 * 60 * 60 * 1000)).toString()}':
            FieldValue.arrayUnion(notesList!)
      });
    } on Exception {
      return;
    }
  }

  @override
  void deleteNotes(DateTime? selectedDate, List<String>? notesList) async {
    try {
      await _firestore
          .collection("Calendar Notes")
          .doc("DlmyxsohA5Uo4HhVEwHYC9DJ6sC2")
          .set({
        'notes': {
          ((selectedDate?.millisecondsSinceEpoch)! ~/ (24 * 60 * 60 * 1000))
              .toString(): notesList
        }
      });
    } on Exception {
      return null;
    }
  }
}
