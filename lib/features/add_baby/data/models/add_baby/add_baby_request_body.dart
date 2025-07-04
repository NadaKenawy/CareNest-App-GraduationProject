import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
part 'add_baby_request_body.g.dart';
@JsonSerializable()
class AddBabyRequestBody {
  final String name;
  final num weightEntry;
  final num heightEntry;
  final String dateOfBirthOfBaby;
  final String gender;
  @JsonKey(ignore: true)
  final File? image;

  AddBabyRequestBody({
    required this.name,
    required this.weightEntry,
    required this.heightEntry,
    required this.dateOfBirthOfBaby,
    required this.gender,
    this.image,
  });

  Map<String, dynamic> toJson() => _$AddBabyRequestBodyToJson(this);
}
