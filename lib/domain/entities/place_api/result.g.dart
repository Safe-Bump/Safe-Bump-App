// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      json['business_status'] as String?,
      json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      json['icon'] as String?,
      json['icon_background_color'] as String?,
      json['icon_mask_base_uri'] as String?,
      json['name'] as String?,
      json['opening_hours'] == null
          ? null
          : OpeningHours.fromJson(
              json['opening_hours'] as Map<String, dynamic>),
      (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['placeId'] as String?,
      json['plusCode'] == null
          ? null
          : PlusCode.fromJson(json['plusCode'] as Map<String, dynamic>),
      (json['rating'] as num?)?.toDouble(),
      json['reference'] as String?,
      json['scope'] as String?,
      (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['vicinity'] as String?,
      json['formatted_address'] as String?,
      json['formatted_phone_number'] as String?,
      (json['address_components'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['adr_address'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'business_status': instance.business_status,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'icon_background_color': instance.icon_background_color,
      'icon_mask_base_uri': instance.icon_mask_base_uri,
      'name': instance.name,
      'opening_hours': instance.opening_hours,
      'photos': instance.photos,
      'placeId': instance.placeId,
      'plusCode': instance.plusCode,
      'rating': instance.rating,
      'reference': instance.reference,
      'scope': instance.scope,
      'types': instance.types,
      'vicinity': instance.vicinity,
      'formatted_address': instance.formatted_address,
      'formatted_phone_number': instance.formatted_phone_number,
      'address_components': instance.address_components,
      'adr_address': instance.adr_address,
    };
