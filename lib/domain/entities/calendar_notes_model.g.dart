// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarNotesModel _$CalendarNotesModelFromJson(Map<String, dynamic> json) =>
    CalendarNotesModel(
      (json['notes'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$CalendarNotesModelToJson(CalendarNotesModel instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
