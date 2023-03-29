import 'package:injectable/injectable.dart';

import '../../domain/entities/calendar_notes_model.dart';

@factoryMethod
abstract class CalendarRepository{
  Future<CalendarNotesModel?> getCalendarNotes();

  void addNotes(DateTime? selectedDate, List<String>? notesList);
  void deleteNotes(DateTime? selectedDate, List<String>? notesList);
}