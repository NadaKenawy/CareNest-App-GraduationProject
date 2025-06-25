import 'package:json_annotation/json_annotation.dart';

part 'create_cry_request_body.g.dart';

@JsonSerializable()
class CreateCryRequestBody {
  final String classType;
  final String audio;

  CreateCryRequestBody({
    required this.classType,
    required this.audio,
  });

  factory CreateCryRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateCryRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCryRequestBodyToJson(this);
} 