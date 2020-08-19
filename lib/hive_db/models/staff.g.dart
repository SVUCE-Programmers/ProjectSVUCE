// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StaffAdapter extends TypeAdapter<Staff> {
  @override
  final int typeId = 2;

  @override
  Staff read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Staff(
      email: fields[0] as String,
      fullName: fields[1] as String,
      avatar: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Staff obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
