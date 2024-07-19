// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameModeAdapter extends TypeAdapter<GameMode> {
  @override
  final int typeId = 4;

  @override
  GameMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GameMode.pve;
      case 1:
        return GameMode.pvp;
      default:
        return GameMode.pve;
    }
  }

  @override
  void write(BinaryWriter writer, GameMode obj) {
    switch (obj) {
      case GameMode.pve:
        writer.writeByte(0);
        break;
      case GameMode.pvp:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
