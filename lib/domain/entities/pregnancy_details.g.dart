// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyDetails _$PregnancyDetailsFromJson(Map<String, dynamic> json) =>
    PregnancyDetails(
      startingDay: json['startingDay'] as int?,
      babyHeight: (json['babyHeight'] as num?)?.toDouble(),
      babyWeight: (json['babyWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PregnancyDetailsToJson(PregnancyDetails instance) =>
    <String, dynamic>{
      'startingDay': instance.startingDay,
      'babyHeight': instance.babyHeight,
      'babyWeight': instance.babyWeight,
    };
