// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredictionResponse _$PredictionResponseFromJson(Map<String, dynamic> json) =>
    PredictionResponse(
      prediction: json['prediction'] as String?,
      probabilities: json['probabilities'] == null
          ? null
          : Probabilities.fromJson(
              json['probabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PredictionResponseToJson(PredictionResponse instance) =>
    <String, dynamic>{
      'prediction': instance.prediction,
      'probabilities': instance.probabilities,
    };

Probabilities _$ProbabilitiesFromJson(Map<String, dynamic> json) =>
    Probabilities(
      bellyPain: json['belly_pain'] as String?,
      burping: json['burping'] as String?,
      discomfort: json['discomfort'] as String?,
      hungry: json['hungry'] as String?,
      tired: json['tired'] as String?,
    );

Map<String, dynamic> _$ProbabilitiesToJson(Probabilities instance) =>
    <String, dynamic>{
      'belly_pain': instance.bellyPain,
      'burping': instance.burping,
      'discomfort': instance.discomfort,
      'hungry': instance.hungry,
      'tired': instance.tired,
    };
