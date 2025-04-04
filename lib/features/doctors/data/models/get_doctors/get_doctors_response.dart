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
  String? masterOf;
  List<String>? phones;
  int? bookingPrice;
  String? image;
  List<String>? images;
  @JsonKey(name: 'About')
  String? about;
  List<DaySchedule>? day;
  int? ratingsQuantity;
  PromoCode? promocode;
  List<Order>? orders;

  String? gender;
  double? ratingsAverage;

  DoctorData({
    this.location,
    this.id,
    this.user,
    this.specialty,
    this.masterOf,
    this.phones,
    this.bookingPrice,
    this.image,
    this.images,
    this.about,
    this.day,
    this.ratingsQuantity,
    this.promocode,
    this.orders,
    this.gender,
    this.ratingsAverage,
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

@JsonSerializable()
class DaySchedule {
  String? type;
  List<Slot>? slots;
  String? id;

  DaySchedule({
    this.type,
    this.slots,
    this.id,
  });

  factory DaySchedule.fromJson(Map<String, dynamic> json) =>
      _$DayScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$DayScheduleToJson(this);
}

@JsonSerializable()
class Slot {
  String? startTime;
  String? endTime;
  @JsonKey(name: '_id')
  String? id;

  Slot({
    this.startTime,
    this.endTime,
    this.id,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

  Map<String, dynamic> toJson() => _$SlotToJson(this);
}

@JsonSerializable()
class PromoCode {
  final String code;
  final DateTime? expireAt;
  final num? value;

  PromoCode({
    required this.code,
    this.expireAt,
    this.value,
  });

  factory PromoCode.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeFromJson(json);

  Map<String, dynamic> toJson() => _$PromoCodeToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  String? id;
  String? doctor;
  OrderDay? day;
  String? status;  

  Order({
    this.id,
    this.doctor,
    this.day,
    this.status,  
  });

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class OrderDay {
  String? type;
  OrderTime? time;
  DateTime? date;

  OrderDay({
    this.type,
    this.time,
    this.date,
  });

  factory OrderDay.fromJson(Map<String, dynamic> json) =>
      _$OrderDayFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDayToJson(this);
}

@JsonSerializable()
class OrderTime {
  String? startTime;

  OrderTime({this.startTime});

  factory OrderTime.fromJson(Map<String, dynamic> json) =>
      _$OrderTimeFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTimeToJson(this);
}
