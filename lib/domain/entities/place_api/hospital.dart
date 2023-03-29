import 'package:json_annotation/json_annotation.dart';
import 'package:safe_bump/domain/entities/place_api/result.dart';

part 'hospital.g.dart';

@JsonSerializable()
class Hospital {
  Hospital({
    required this.results,
    required this.status,
  });

  final List<Result> results;
  final String status;

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}
