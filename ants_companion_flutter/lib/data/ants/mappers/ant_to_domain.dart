import 'package:ants_companion_client/ants_companion_client.dart' as data;
import 'package:ants_companion_flutter/domain/models/ant.dart';
import 'package:ants_companion_flutter/domain/models/ant_tier_tag.dart';
import 'package:ants_companion_flutter/domain/models/ant_type.dart';
import 'package:ants_companion_flutter/domain/models/lineup_position.dart';
import 'package:ants_companion_flutter/domain/models/tier_rating.dart';

extension AntListToDomainExtension on List<data.Ant> {
  List<Ant> toDomain() => map((it) => it.toDomain()).toList();
}

extension AntToDomainExtension on data.Ant {
  Ant toDomain() {
    return Ant(
      id: id.toString(),
      name: name,
      description: description,
      tierTags: tierTags?.map((it) => it.toDomain(type)).toList() ?? [],
    );
  }
}

extension TierTagToDomainExtension on data.TierTag {
  AntTierTag toDomain(data.AntType antType) {
    return AntPvpTierTag(
      rating: TierRating.meta,
      reason: reason,
      antType: antType.toDomain(),
      rowPosition: position.toDomain(),
    );
  }
}

extension on data.AntType {
  AntType toDomain() => switch (this) {
        data.AntType.guardian => AntType.guardian,
        data.AntType.shooter => AntType.shooter,
        data.AntType.carrier => AntType.carrier,
        data.AntType.universal => AntType.universal,
      };
}

extension on data.LineupPosition {
  LineupPosition toDomain() => switch (this) {
        data.LineupPosition.front => LineupPosition.front,
        data.LineupPosition.middle => LineupPosition.middle,
        data.LineupPosition.back => LineupPosition.back,
      };
}
