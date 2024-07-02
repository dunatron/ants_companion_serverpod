import 'package:ants_companion_flutter/data/_model_type_ids.dart';
import 'package:hive/hive.dart';

part 'ant_role.g.dart';

@HiveType(typeId: ModelTypeIds.antRole)
enum AntRole {
  @HiveField(0)
  melee,
  @HiveField(1)
  support,
  @HiveField(2)
  ranged,
}
