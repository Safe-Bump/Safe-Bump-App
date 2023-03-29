import 'package:json_annotation/json_annotation.dart';
import 'package:safe_bump/domain/entities/place_api/viewport.dart';

import 'location.dart';

part 'geometry.g.dart';

@JsonSerializable()
class Geometry {
  Geometry({
    required this.location,
    required this.viewport,
  });

  final Location location;
  final Viewport viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}