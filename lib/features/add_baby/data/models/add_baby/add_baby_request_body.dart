import 'package:json_annotation/json_annotation.dart';
part 'add_baby_request_body.g.dart';
@JsonSerializable()
class AddBabyRequestBody {
  final String name;
  final num weight;
  final num height;
  final String dateOfBirthOfBaby;
  final String gender;

  AddBabyRequestBody({
    required this.name,
    required this.weight,
    required this.height,
    required this.dateOfBirthOfBaby,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$AddBabyRequestBodyToJson(this);
}
