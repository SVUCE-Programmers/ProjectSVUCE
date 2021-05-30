// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceAdapter extends TypeAdapter<Attendance> {
  @override
  final int typeId = 0;

  @override
  Attendance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attendance(
      subject: fields[0] as String,
      present: fields[1] as int,
      absent: fields[2] as int,
      total: fields[3] as int,
      lastUpdated: (fields[4] as List)?.cast<String>(),
      color: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Attendance obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.present)
      ..writeByte(2)
      ..write(obj.absent)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.lastUpdated)
      ..writeByte(5)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
