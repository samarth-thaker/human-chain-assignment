// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncidentModelAdapter extends TypeAdapter<IncidentModel> {
  @override
  final int typeId = 0;

  @override
  IncidentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IncidentModel(
      title: fields[0] as String,
      description: fields[1] as String,
      severity: fields[2] as String,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, IncidentModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.severity)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncidentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
