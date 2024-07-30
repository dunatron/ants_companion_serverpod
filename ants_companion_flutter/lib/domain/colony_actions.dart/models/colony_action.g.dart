// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colony_action.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColonyActionAdapter extends TypeAdapter<ColonyAction> {
  @override
  final int typeId = 7;

  @override
  ColonyAction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColonyAction(
      key: fields[0] as String,
      order: fields[1] as int,
      date: fields[2] as DateTime,
      day: fields[3] as int,
      hour: fields[4] as int,
      notificationEnabled: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ColonyAction obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.order)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.day)
      ..writeByte(4)
      ..write(obj.hour)
      ..writeByte(5)
      ..write(obj.notificationEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColonyActionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
