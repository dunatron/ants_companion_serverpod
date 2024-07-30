import 'package:ants_companion_flutter/domain/_store_model_type_ids.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'colony_action.g.dart';

@HiveType(typeId: StoreModelTypeIds.colonyAction)
class ColonyAction extends Equatable {
  const ColonyAction({
    required this.key,
    required this.order,
    required this.date,
    required this.day,
    required this.hour,
    required this.notificationEnabled,
  });

  static String makeKey({required int day, required int hour}) {
    return '${day + 1}-$hour';
  }

  @HiveField(0)
  final String key;

  @HiveField(1)
  final int order;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final int day;

  @HiveField(4)
  final int hour;

  @HiveField(5)
  final bool notificationEnabled;

  ColonyAction copyWith({
    bool? notificationEnabled,
  }) {
    return ColonyAction(
      key: key,
      order: order,
      date: date,
      day: day,
      hour: hour,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
    );
  }

  @override
  List<Object?> get props => [key, date, day, hour, notificationEnabled];
}
