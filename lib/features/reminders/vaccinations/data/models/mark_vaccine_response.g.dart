// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_vaccine_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkVaccineResponse _$MarkVaccineResponseFromJson(Map<String, dynamic> json) =>
    MarkVaccineResponse(
      msg: json['msg'] as String?,
      vaccineData: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              VaccineAdministeredData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


VaccineAdministeredData _$VaccineAdministeredDataFromJson(
        Map<String, dynamic> json) =>
    VaccineAdministeredData(
      vaccineId: json['vaccineId'] as String?,
      administered: json['administered'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

