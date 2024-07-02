import 'package:ants_companion_client/ants_companion_client.dart' as api;
import 'package:ants_companion_flutter/data/tier_tags/mappers/lineup_position_mappers.dart';
import 'package:ants_companion_flutter/data/tier_tags/mappers/tier_rating_mappers.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_tag.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';

extension TierTagApiModelToDomainExtension on api.TierTag {
  test() {}
  TierTag toDomain() => AntPvpTierTag(
        antId: antId.toString(),
        rating: TierRating.meta,
        reason: reason,
        lineupPosition: position.toDomain(),
      );
}

extension ApiTierTagFromDomainExtension on TierTag {
  api.TierTag toApiModel() {
    final (position, antId) = switch (this) {
      AntTierTag(:var lineupPosition, :var antId) => (lineupPosition, antId),
    };

    final tagType = switch (this) {
      AntPveTierTag _ => api.TierTagType.pve,
      AntPvpTierTag _ => api.TierTagType.pvp,
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
