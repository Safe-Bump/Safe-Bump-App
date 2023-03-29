// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      height: json['height'] as int,
      photo_reference: json['photo_reference'] as String,
      width: json['width'] as int,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'height': instance.height,
      'photo_reference': instance.photo_reference,
      'width': instance.width,
    };
