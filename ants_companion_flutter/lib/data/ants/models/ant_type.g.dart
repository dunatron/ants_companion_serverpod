// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ant_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AntTypeAdapter extends TypeAdapter<AntType> {
  @override
  final int typeId = 1;

  @override
  AntType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AntType.guardian;
      case 1:
        return AntType.shooter;
      case 2:
        return AntType.carrier;
      case 3:
        return AntType.universal;
      default:
        return AntType.guardian;
    }
  }

  @override
  void write(BinaryWriter writer, AntType obj) {
    switch (obj) {
      case AntType.guardian:
        writer.writeByte(0);
        break;
      case AntType.shooter:
        writer.writeByte(1);
        break;
      case AntType.carrier:
        writer.writeByte(2);
        break;
      case AntType.universal:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AntTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
