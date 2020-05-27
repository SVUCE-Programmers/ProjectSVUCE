// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlacementAdapter extends TypeAdapter<Placement> {
  @override
  Placement read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Placement(
      year: fields[0] as String,
      no: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Placement obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.year)
      ..writeByte(1)
      ..write(obj.no);
  }

  @override
  int get typeId => 3;
}
