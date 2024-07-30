import 'package:ants_companion_client/ants_companion_client.dart' as api;
import 'package:ants_companion_flutter/data/tier_tags/mappers/lineup_position_mappers.dart';
import 'package:ants_companion_flutter/data/tier_tags/mappers/tier_rating_mappers.dart';
import 'package:ants_companion_flutter/domain/models/game_mode.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/ant_tier_tag.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';

extension AntListToDomainExtension on List<api.TierTag> {
  List<AntTierTag> toDomain() => map((it) => it.toDomain()).toList();
}

extension TierTagApiModelToDomainExtension on api.TierTag {
  AntTierTag toDomain() => AntTierTag(
        id: id.toString(),
        antId: antId.toString(),
        gameMode: type == api.TierTagType.pve ? GameMode.pve : GameMode.pvp,
        rating: rating.toDomain(),
        reason: reason,
        lineupPosition: position.toDomain(),
      );
}

extension ApiTierTagFromDomainExtension on AntTierTag {
  api.TierTag toApiModel() {
    final (position, antId) = switch (this) {
      AntTierTag(:var lineupPosition, :var antId) => (lineupPosition, antId),
    };

    final tagType = switch (gameMode) {
      GameMode.pve => api.TierTagType.pve,
      GameMode.pvp => api.TierTagType.pvp,
    };

    return api.TierTag(
      type: tagType,
      rating: rating.toApiModel(),
      position: position.toApiModel(),
      reason: reason,
      createdAt: DateTime.now(),
      antId: int.parse(antId),
    );
  }
}


// extension ApiTierTagFromDomainExtension on TierTag {
//   api.TierTag toApiModel() {
//     final tagType = switch (this) {
//       AntPveTierTag() => api.TierTagType.pve,
//       AntPvpTierTag() => api.TierTagType.pvp,
//     };

//     final position = switch (this) {
//       AntTierTag(lineupPosition: final lineupPosition) => lineupPosition,
//     };

//     final antId = switch (this) {
//       AntTierTag(antId: final antId) => antId,
//     };

//     return api.TierTag(
//       type: tagType,
//       rating: rating.toApiModel(),
//       position: position.toApiModel(),
//       reason: reason,
//       createdAt: DateTime.now(),
//       antId: int.parse(antId),
//     );
//   }
// }
