import 'package:json_annotation/json_annotation.dart';
import 'package:safe_bump/domain/entities/place_api/photo.dart';
import 'package:safe_bump/domain/entities/place_api/plus_code.dart';

import 'address_component.dart';
import 'geometry.dart';
import 'opening_hours.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  final String? business_status;
  final Geometry? geometry;
  final String? icon;
  final String? icon_background_color;
  final String? icon_mask_base_uri;
  final String? name;
  final OpeningHours? opening_hours;
  final List<Photo>? photos;
  final String? placeId;
  final PlusCode? plusCode;
  final double? rating;
  final String? reference;
  final String? scope;
  final List<String>? types;
  final String? vicinity;
  final String? formatted_address;
  final String? formatted_phone_number;
  final List<AddressComponent>? address_components;
  final String? url;
  final String? adr_address;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Result(
      this.business_status,
      this.geometry,
      this.icon,
      this.icon_background_color,
      this.icon_mask_base_uri,
      this.name,
      this.opening_hours,
      this.photos,
      this.placeId,
      this.plusCode,
      this.rating,
      this.url,
      this.reference,
      this.scope,
      this.types,
      this.vicinity,
      this.formatted_address,
      this.formatted_phone_number,
      this.address_components,
      this.adr_address);
}
