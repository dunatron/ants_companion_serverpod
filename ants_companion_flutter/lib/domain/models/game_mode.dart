import 'package:ants_companion_flutter/domain/_store_model_type_ids.dart';
import 'package:hive/hive.dart';

part 'game_mode.g.dart';

@HiveType(typeId: StoreModelTypeIds.gameMode)
enum GameMode {
  @HiveField(0)
  pve,
  @HiveField(1)
  pvp
}
