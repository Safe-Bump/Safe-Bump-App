import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'viewport.g.dart';

@JsonSerializable()
class Viewport {
  Viewport({
    required this.northeast,
    required this.southwest,
  });

  final Location northeast;
  final Location southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) =>
      _$ViewportFromJson(json);

  Map<String, dynamic> toJson() => _$ViewportToJson(this);
}