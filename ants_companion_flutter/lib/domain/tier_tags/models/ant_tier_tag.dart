import 'package:ants_companion_flutter/domain/_store_model_type_ids.dart';
import 'package:ants_companion_flutter/domain/models/game_mode.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/lineup_position.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';
import 'package:equatable/equatable.dart';

import 'package:hive/hive.dart';

part 'ant_tier_tag.g.dart';

@HiveType(typeId: StoreModelTypeIds.tierTag)
class AntTierTag extends Equatable {
  const AntTierTag({
    required this.id,
    required this.antId,
    required this.gameMode,
    required this.lineupPosition,
    required this.rating,
    required this.reason,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String antId;

  @HiveField(2)
  final GameMode gameMode;

  @HiveField(3)
  final LineupPosition lineupPosition;

  @HiveField(4)
  final TierRating rating;

  @HiveField(5)
  final String reason;

  @override
  List<Object?> get props => [antId, rating, reason, lineupPosition];
}
