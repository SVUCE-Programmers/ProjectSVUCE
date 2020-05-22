// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceAdapter extends TypeAdapter<Attendance> {
  @override
  Attendance read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attendance(
      subject: fields[0] as String,
      present: fields[1] as int,
      absent: fields[2] as int,
      total: fields[3] as int,
      lastUpdated: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Attendance obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.present)
      ..writeByte(2)
      ..write(obj.absent)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.lastUpdated);
  }
  @override
  int get typeId =>2;
}
