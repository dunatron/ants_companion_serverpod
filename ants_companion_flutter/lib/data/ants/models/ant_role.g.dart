// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ant_role.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AntRoleAdapter extends TypeAdapter<AntRole> {
  @override
  final int typeId = 2;

  @override
  AntRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AntRole.melee;
      case 1:
        return AntRole.support;
      case 2:
        return AntRole.ranged;
      default:
        return AntRole.melee;
    }
  }

  @override
  void write(BinaryWriter writer, AntRole obj) {
    switch (obj) {
      case AntRole.melee:
        writer.writeByte(0);
        break;
      case AntRole.support:
        writer.writeByte(1);
        break;
      case AntRole.ranged:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AntRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
