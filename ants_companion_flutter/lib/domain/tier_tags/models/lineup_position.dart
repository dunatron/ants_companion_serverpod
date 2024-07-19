import 'package:ants_companion_flutter/domain/_store_model_type_ids.dart';
import 'package:hive/hive.dart';

part 'lineup_position.g.dart';

@HiveType(typeId: StoreModelTypeIds.lineupPosition)
enum LineupPosition {
  @HiveField(0)
  front,
  @HiveField(1)
  middle,
  @HiveField(2)
  back,
}
