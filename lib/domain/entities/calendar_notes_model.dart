import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar_notes_model.g.dart';

@JsonSerializable()
class CalendarNotesModel extends Equatable {
  final Map<String, List<String>> notes;

  CalendarNotesModel(this.notes);

  factory CalendarNotesModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarNotesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarNotesModelToJson(this);

  @override
  List<Object?> get props => [this.notes];
}
