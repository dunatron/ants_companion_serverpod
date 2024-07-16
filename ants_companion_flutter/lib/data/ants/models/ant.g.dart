// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AntAdapter extends TypeAdapter<Ant> {
  @override
  final int typeId = 0;

  @override
  Ant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ant(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      type: fields[3] as AntType,
      role: fields[4] as AntRole,
      profileImageUrl: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Ant obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.profileImageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AntAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
