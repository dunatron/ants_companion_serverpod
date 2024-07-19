// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tier_rating.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TierRatingAdapter extends TypeAdapter<TierRating> {
  @override
  final int typeId = 6;

  @override
  TierRating read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TierRating.meta;
      case 1:
        return TierRating.f2pMeta;
      case 2:
        return TierRating.s;
      case 3:
        return TierRating.a;
      case 4:
        return TierRating.b;
      case 5:
        return TierRating.c;
      case 6:
        return TierRating.f;
      default:
        return TierRating.meta;
    }
  }

  @override
  void write(BinaryWriter writer, TierRating obj) {
    switch (obj) {
      case TierRating.meta:
        writer.writeByte(0);
        break;
      case TierRating.f2pMeta:
        writer.writeByte(1);
        break;
      case TierRating.s:
        writer.writeByte(2);
        break;
      case TierRating.a:
        writer.writeByte(3);
        break;
      case TierRating.b:
        writer.writeByte(4);
        break;
      case TierRating.c:
        writer.writeByte(5);
        break;
      case TierRating.f:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TierRatingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
