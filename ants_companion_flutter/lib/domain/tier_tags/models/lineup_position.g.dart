// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup_position.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LineupPositionAdapter extends TypeAdapter<LineupPosition> {
  @override
  final int typeId = 5;

  @override
  LineupPosition read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LineupPosition.front;
      case 1:
        return LineupPosition.middle;
      case 2:
        return LineupPosition.back;
      default:
        return LineupPosition.front;
    }
  }

  @override
  void write(BinaryWriter writer, LineupPosition obj) {
    switch (obj) {
      case LineupPosition.front:
        writer.writeByte(0);
        break;
      case LineupPosition.middle:
        writer.writeByte(1);
        break;
      case LineupPosition.back:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LineupPositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
