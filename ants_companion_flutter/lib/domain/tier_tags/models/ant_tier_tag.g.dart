// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ant_tier_tag.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AntTierTagAdapter extends TypeAdapter<AntTierTag> {
  @override
  final int typeId = 3;

  @override
  AntTierTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AntTierTag(
      id: fields[0] as String,
      antId: fields[1] as String,
      gameMode: fields[2] as GameMode,
      lineupPosition: fields[3] as LineupPosition,
      rating: fields[4] as TierRating,
      reason: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AntTierTag obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.antId)
      ..writeByte(2)
      ..write(obj.gameMode)
      ..writeByte(3)
      ..write(obj.lineupPosition)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AntTierTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
