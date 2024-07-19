import 'package:ants_companion_flutter/data/ants/datasource/ants_local_datasource.dart';
import 'package:ants_companion_flutter/data/tier_tags/datasource/tier_tags_local_datasource.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_role.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';
import 'package:ants_companion_flutter/domain/models/game_mode.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/ant_tier_tag.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/lineup_position.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> registerLocalDataSources() async {
  // Hive.registerAdapter(AntAdapter());

  // ants
  Hive.registerAdapter(AntAdapter());
  Hive.registerAdapter(AntTypeAdapter());
  Hive.registerAdapter(AntRoleAdapter());

  // game mode
  Hive.registerAdapter(GameModeAdapter());

  // tier tags
  Hive.registerAdapter(AntTierTagAdapter());
  Hive.registerAdapter(LineupPositionAdapter());
  Hive.registerAdapter(TierRatingAdapter());

  final antsDatasourceBox = await Hive.openBox<Ant>('ants_datasource_box');

  final tierTagsDatasourceBox =
      await Hive.openBox<AntTierTag>('tier_tags_datasource_box');

  GetIt.I.registerLazySingleton(() => AntsLocalDatasource(antsDatasourceBox));
  GetIt.I.registerLazySingleton(
    () => TierTagsLocalDatasource(tierTagsDatasourceBox),
  );
}
