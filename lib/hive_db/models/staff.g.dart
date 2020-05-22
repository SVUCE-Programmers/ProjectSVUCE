// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StaffAdapter extends TypeAdapter<Staff> {
  @override
  Staff read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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
  int get typeId => 0;
}
