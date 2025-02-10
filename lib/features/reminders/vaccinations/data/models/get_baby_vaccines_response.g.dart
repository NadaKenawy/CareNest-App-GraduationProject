// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_baby_vaccines_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetBabyVaccinesResponseAdapter
    extends TypeAdapter<GetBabyVaccinesResponse> {
  @override
  final int typeId = 2;

  @override
  GetBabyVaccinesResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetBabyVaccinesResponse(
      message: fields[0] as String?,
      vaccineData: (fields[1] as List?)?.cast<BabyVaccineData>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetBabyVaccinesResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.vaccineData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetBabyVaccinesResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BabyVaccineDataAdapter extends TypeAdapter<BabyVaccineData> {
  @override
  final int typeId = 1;

  @override
  BabyVaccineData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BabyVaccineData(
      vaccine: fields[0] as Vaccine?,
      administered: fields[1] as bool?,
      notificationSent: fields[2] as bool?,
      date: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, BabyVaccineData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.vaccine)
      ..writeByte(1)
      ..write(obj.administered)
      ..writeByte(2)
      ..write(obj.notificationSent)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BabyVaccineDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VaccineAdapter extends TypeAdapter<Vaccine> {
  @override
  final int typeId = 0;

  @override
  Vaccine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vaccine(
      id: fields[0] as String?,
      name: fields[1] as String?,
      ageRequired: fields[2] as int?,
      dose: fields[3] as int?,
      vaccineType: fields[4] as String?,
      description: fields[5] as String?,
      repeat: fields[6] as bool?,
      createdAt: fields[7] as DateTime?,
      updatedAt: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Vaccine obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ageRequired)
      ..writeByte(3)
      ..write(obj.dose)
      ..writeByte(4)
      ..write(obj.vaccineType)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.repeat)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VaccineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBabyVaccinesResponse _$GetBabyVaccinesResponseFromJson(
        Map<String, dynamic> json) =>
    GetBabyVaccinesResponse(
      message: json['message'] as String?,
      vaccineData: (json['data'] as List<dynamic>?)
          ?.map((e) => BabyVaccineData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBabyVaccinesResponseToJson(
        GetBabyVaccinesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.vaccineData?.map((e) => e.toJson()).toList(),
    };

BabyVaccineData _$BabyVaccineDataFromJson(Map<String, dynamic> json) =>
    BabyVaccineData(
      vaccine: json['vaccine'] == null
          ? null
          : Vaccine.fromJson(json['vaccine'] as Map<String, dynamic>),
      administered: json['administered'] as bool?,
      notificationSent: json['notificationSent'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$BabyVaccineDataToJson(BabyVaccineData instance) =>
    <String, dynamic>{
      'vaccine': instance.vaccine?.toJson(),
      'administered': instance.administered,
      'notificationSent': instance.notificationSent,
      'date': instance.date?.toIso8601String(),
    };

Vaccine _$VaccineFromJson(Map<String, dynamic> json) => Vaccine(
      id: idFromJson(json['_id']),
      name: json['name'] as String?,
      ageRequired: (json['ageRequired'] as num?)?.toInt(),
      dose: (json['dose'] as num?)?.toInt(),
      vaccineType: json['vaccineType'] as String?,
      description: json['description'] as String?,
      repeat: json['repeat'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$VaccineToJson(Vaccine instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'ageRequired': instance.ageRequired,
      'dose': instance.dose,
      'vaccineType': instance.vaccineType,
      'description': instance.description,
      'repeat': instance.repeat,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
