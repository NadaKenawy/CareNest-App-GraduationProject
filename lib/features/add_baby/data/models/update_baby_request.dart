import 'package:json_annotation/json_annotation.dart';

part 'update_baby_request.g.dart';

@JsonSerializable()
class UpdateBabyRequest {
  final String id;
  final String? name;
  final num? weight;
  final num? height;
  final String? dateOfBirthOfBaby;
  final String? gender;

  UpdateBabyRequest({
    required this.id,
    this.name,
    this.weight,
    this.height,
    this.dateOfBirthOfBaby,
    this.gender,
  });

  Map<String, dynamic> toJson() => _$UpdateBabyRequestToJson(this);

  factory UpdateBabyRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBabyRequestFromJson(json);
}
