import 'package:json_annotation/json_annotation.dart';

part 'put_growth_data_request.g.dart';

@JsonSerializable()
class PutGrowthDataRequest {
  final num? heightEntry;
  final num? weightEntry;

  PutGrowthDataRequest({
    this.heightEntry,
    this.weightEntry,
  });

  Map<String, dynamic> toJson() => _$PutGrowthDataRequestToJson(this);

  factory PutGrowthDataRequest.fromJson(Map<String, dynamic> json) =>
      _$PutGrowthDataRequestFromJson(json);
}
