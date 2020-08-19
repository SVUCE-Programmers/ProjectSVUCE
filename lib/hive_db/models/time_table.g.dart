// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeTableAdapter extends TypeAdapter<TimeTable> {
  @override
  final int typeId = 3;

  @override
  TimeTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeTable(
      className: fields[0] as String,
      startTime: fields[1] as String,
      endTime: fields[2] as String,
      day: fields[3] as String,
      year: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TimeTable obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.className)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.endTime)
      ..writeByte(3)
      ..write(obj.day)
      ..writeByte(4)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
