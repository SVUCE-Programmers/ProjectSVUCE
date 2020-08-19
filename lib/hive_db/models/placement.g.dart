// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlacementAdapter extends TypeAdapter<Placement> {
  @override
  final int typeId = 1;

  @override
  Placement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
