import 'package:json_annotation/json_annotation.dart';

part 'address_component.g.dart';

@JsonSerializable()
class AddressComponent{
  final String long_name;
  final String short_name;
  final List<String> types;

  AddressComponent(this.long_name, this.short_name, this.types);

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentFromJson(json);

  Map<String, dynamic> toJson() => _$AddressComponentToJson(this);
}