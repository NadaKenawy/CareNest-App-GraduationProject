import 'package:json_annotation/json_annotation.dart';

part 'get_doctors_response.g.dart';

@JsonSerializable()
class GetDoctorsResponse {
  int? totalResults;

  List<DoctorData>? data;

  GetDoctorsResponse({
    this.totalResults,
    this.data,
  });

  factory GetDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDoctorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDoctorsResponseToJson(this);
}

@JsonSerializable()
class DoctorData {
  @JsonKey(name: 'Location')
  LocationDetails? location;
  @JsonKey(name: '_id')
  String? id;

  User? user;
  @JsonKey(name: 'Specialty')
  String? specialty;
  String? image;
  List<String>? images;

  DoctorData({
    this.location,
    this.id,
    this.user,
    this.specialty,
    this.image,
    this.images,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);
}

@JsonSerializable()
class LocationDetails {
  String? type;

  List<double>? coordinates;

  String? mainPlace;

  String? address;

  LocationDetails({
    this.type,
    this.coordinates,
    this.mainPlace,
    this.address,
  });

  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDetailsToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;
  String? firstName;
  String? lastName;

  User({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
