import 'package:json_annotation/json_annotation.dart';

part 'delete_baby_request.g.dart';

@JsonSerializable()
class DeleteBabyRequest {
  final String id;

  DeleteBabyRequest({
    required this.id,
  });

  Map<String, dynamic> toJson() => _$DeleteBabyRequestToJson(this);

  factory DeleteBabyRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteBabyRequestFromJson(json);
}
