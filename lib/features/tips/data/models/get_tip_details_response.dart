import 'package:json_annotation/json_annotation.dart';

part 'get_tip_details_response.g.dart';

@JsonSerializable()
class GetTipDetailsResponse {
  final TipDetails data;

  GetTipDetailsResponse({
    required this.data,
  });

  factory GetTipDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTipDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetTipDetailsResponseToJson(this);
}

@JsonSerializable()
class TipDetails {
  @JsonKey(name: "_id")
  final String id;
  final String target;
  @JsonKey(defaultValue: 0)
  final int month;
  final String category;
  final String header;
  final List<TipItem> tip;
  final String advice;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: "__v")
  final int v;

  TipDetails({
    required this.id,
    required this.target,
    required this.month,
    required this.category,
    required this.header,
    required this.tip,
    required this.advice,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TipDetails.fromJson(Map<String, dynamic> json) =>
      _$TipDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TipDetailsToJson(this);
}

@JsonSerializable()
class TipItem {
  final String title;
  final String description;
  @JsonKey(name: "_id")
  final String id;

  TipItem({
    required this.title,
    required this.description,
    required this.id,
  });

  factory TipItem.fromJson(Map<String, dynamic> json) =>
      _$TipItemFromJson(json);
  Map<String, dynamic> toJson() => _$TipItemToJson(this);
}
