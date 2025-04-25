// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorsResponse _$GetDoctorsResponseFromJson(Map<String, dynamic> json) =>
    GetDoctorsResponse(
      totalResults: (json['totalResults'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDoctorsResponseToJson(GetDoctorsResponse instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'data': instance.data,
    };

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
      location: json['Location'] == null
          ? null
          : LocationDetails.fromJson(json['Location'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      specialty: json['Specialty'] as String?,
      masterOf: json['masterOf'] as String?,
      phones:
          (json['phones'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bookingPrice: (json['bookingPrice'] as num?)?.toInt(),
      image: json['image'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      about: json['About'] as String?,
      day: (json['day'] as List<dynamic>?)
          ?.map((e) => DaySchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
      promocode: json['promocode'] == null
          ? null
          : PromoCode.fromJson(json['promocode'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      gender: json['gender'] as String?,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
      'Location': instance.location,
      '_id': instance.id,
      'user': instance.user,
      'Specialty': instance.specialty,
      'masterOf': instance.masterOf,
      'phones': instance.phones,
      'bookingPrice': instance.bookingPrice,
      'image': instance.image,
      'images': instance.images,
      'About': instance.about,
      'day': instance.day,
      'ratingsQuantity': instance.ratingsQuantity,
      'promocode': instance.promocode,
      'orders': instance.orders,
      'gender': instance.gender,
      'ratingsAverage': instance.ratingsAverage,
    };

LocationDetails _$LocationDetailsFromJson(Map<String, dynamic> json) =>
    LocationDetails(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      mainPlace: json['mainPlace'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$LocationDetailsToJson(LocationDetails instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
      'mainPlace': instance.mainPlace,
      'address': instance.address,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

DaySchedule _$DayScheduleFromJson(Map<String, dynamic> json) => DaySchedule(
      type: json['type'] as String?,
      slots: (json['slots'] as List<dynamic>?)
          ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DayScheduleToJson(DaySchedule instance) =>
    <String, dynamic>{
      'type': instance.type,
      'slots': instance.slots,
      'id': instance.id,
    };

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      '_id': instance.id,
    };

PromoCode _$PromoCodeFromJson(Map<String, dynamic> json) => PromoCode(
      code: json['code'] as String?,
      expireAt: json['expireAt'] == null
          ? null
          : DateTime.parse(json['expireAt'] as String),
      value: json['value'] as num?,
    );

Map<String, dynamic> _$PromoCodeToJson(PromoCode instance) => <String, dynamic>{
      'code': instance.code,
      'expireAt': instance.expireAt?.toIso8601String(),
      'value': instance.value,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['_id'] as String?,
      doctor: json['doctor'] as String?,
      day: json['day'] == null
          ? null
          : OrderDay.fromJson(json['day'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      '_id': instance.id,
      'doctor': instance.doctor,
      'day': instance.day,
      'status': instance.status,
    };

OrderDay _$OrderDayFromJson(Map<String, dynamic> json) => OrderDay(
      type: json['type'] as String?,
      time: json['time'] == null
          ? null
          : OrderTime.fromJson(json['time'] as Map<String, dynamic>),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$OrderDayToJson(OrderDay instance) => <String, dynamic>{
      'type': instance.type,
      'time': instance.time,
      'date': instance.date?.toIso8601String(),
    };

OrderTime _$OrderTimeFromJson(Map<String, dynamic> json) => OrderTime(
      startTime: json['startTime'] as String?,
    );

Map<String, dynamic> _$OrderTimeToJson(OrderTime instance) => <String, dynamic>{
      'startTime': instance.startTime,
    };
