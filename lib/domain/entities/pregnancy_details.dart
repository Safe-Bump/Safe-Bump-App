import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'pregnancy_details.g.dart';

@JsonSerializable()
class PregnancyDetails extends Equatable {
  final int? startingDay;
  final double? babyHeight;
  final double? babyWeight;

  const PregnancyDetails(this.startingDay, this.babyHeight, this.babyWeight);

  factory PregnancyDetails.fromJson(Map<String, dynamic> json) =>
      _$PregnancyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PregnancyDetailsToJson(this);

  @override
  List<Object?> get props =>
      [startingDay, babyHeight, babyWeight];
}
