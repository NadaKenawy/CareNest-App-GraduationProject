import 'package:json_annotation/json_annotation.dart';

part 'update_baby_request.g.dart';

@JsonSerializable()
class UpdateBabyRequest {
  final String? name;
  final num? weight;
  final num? height;
  final String? dateOfBirthOfBaby;
 

  UpdateBabyRequest({
    this.name,
    this.weight,
    this.height,
    this.dateOfBirthOfBaby,
   
  });

  Map<String, dynamic> toJson() => _$UpdateBabyRequestToJson(this);

  factory UpdateBabyRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBabyRequestFromJson(json);
}
