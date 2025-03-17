import 'package:json_annotation/json_annotation.dart';

part 'prediction_response_model.g.dart';

@JsonSerializable()
class PredictionResponse {
  final String? prediction;
  final Probabilities? probabilities;

  PredictionResponse({this.prediction, this.probabilities});

  factory PredictionResponse.fromJson(Map<String, dynamic> json) =>
      _$PredictionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionResponseToJson(this);
}

@JsonSerializable()
class Probabilities {
  @JsonKey(name: 'belly_pain')
  final String? bellyPain;

  @JsonKey(name: 'burping')
  final String? burping;

  @JsonKey(name: 'discomfort')
  final String? discomfort;

  @JsonKey(name: 'hungry')
  final String? hungry;

  @JsonKey(name: 'tired')
  final String? tired;

  Probabilities({
    this.bellyPain,
    this.burping,
    this.discomfort,
    this.hungry,
    this.tired,
  });

  factory Probabilities.fromJson(Map<String, dynamic> json) =>
      _$ProbabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ProbabilitiesToJson(this);
}
