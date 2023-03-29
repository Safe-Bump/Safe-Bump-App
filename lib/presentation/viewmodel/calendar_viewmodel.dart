import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:safe_bump/domain/entities/calendar_notes_model.dart';

import '../../domain/usecases/calendar_use_case.dart';

class CalendarViewModel extends ChangeNotifier {
  final CalendarUseCase _calendarUseCase;

  CalendarViewModel(this._calendarUseCase);

  CalendarNotesModel? _calendarNotesModel;

  CalendarNotesModel? get user => _calendarNotesModel;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  DateTime? _focusedDate;

  DateTime? get focusedDate => _focusedDate;

  List<String>? _notesList;

  List<String>? get notesList => _notesList;

  void setLoading(bool value) {
    _isLoading = value;
    // notifyListeners();
  }

  Future<Void?> getCalendarNotes() async {
    setLoading(true);
    _calendarNotesModel = await _calendarUseCase.getCalendarNotes();
    _notesList = _calendarNotesModel?.notes.putIfAbsent(
        ((selectedDate?.millisecondsSinceEpoch)! ~/ (24 * 60 * 60 * 1000))
            .toString(),
        () => List.empty(growable: true));
    setLoading(false);
    notifyListeners();
  }

  void onSelectedDateChanged(DateTime selectedDate) {
    _selectedDate = selectedDate;
    // notifyListeners();
  }

  void onFocusedDateChanged(DateTime focusedDate) {
    _focusedDate = focusedDate;
    // notifyListeners();
  }

  Future<Void?> addNotes(String text) async {
    _notesList?.add(text);
    await _calendarUseCase.addNotes(selectedDate, notesList);
    notifyListeners();
  }

  Future<Void?> deleteNotes(int index) async {
    _notesList?.removeAt(index);
    await _calendarUseCase.addNotes(selectedDate, notesList);
    notifyListeners();
  }
}
