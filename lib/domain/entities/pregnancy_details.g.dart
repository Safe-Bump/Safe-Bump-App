// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyDetails _$PregnancyDetailsFromJson(Map<String, dynamic> json) =>
    PregnancyDetails(
      json['startingDay'] as int?,
      (json['babyHeight'] as num?)?.toDouble(),
      (json['babyWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PregnancyDetailsToJson(PregnancyDetails instance) =>
    <String, dynamic>{
      'startingDay': instance.startingDay,
      'babyHeight': instance.babyHeight,
      'babyWeight': instance.babyWeight,
    };
