
import 'package:injectable/injectable.dart';
import 'package:safe_bump/data/repositories/calendar_repository.dart';
import 'package:safe_bump/domain/entities/calendar_notes_model.dart';

@injectable
class CalendarUseCase{
  final CalendarRepository _calendarRepository;
  CalendarUseCase(this._calendarRepository);

  Future<CalendarNotesModel?> getCalendarNotes() async{
    return _calendarRepository.getCalendarNotes();
  }

  addNotes(DateTime? selectedDate, List<String>? notesList) {
    _calendarRepository.addNotes(selectedDate,notesList);
  }

  deleteNotes(DateTime? selectedDate, List<String>? notesList) {
    _calendarRepository.deleteNotes(selectedDate,notesList);
  }
}