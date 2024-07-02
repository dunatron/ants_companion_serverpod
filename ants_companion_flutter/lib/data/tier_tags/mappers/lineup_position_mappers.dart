import 'package:ants_companion_client/ants_companion_client.dart' as api;
import 'package:ants_companion_flutter/domain/tier_tags/models/lineup_position.dart';

extension LineupPositionApiModelToDomainExtension on api.LineupPosition {
  LineupPosition toDomain() => switch (this) {
        api.LineupPosition.front => LineupPosition.front,
        api.LineupPosition.middle => LineupPosition.middle,
        api.LineupPosition.back => LineupPosition.back,
      };
}

extension LineupPositionFromDomainExtension on LineupPosition {
  api.LineupPosition toApiModel() => switch (this) {
        LineupPosition.front => api.LineupPosition.front,
        LineupPosition.middle => api.LineupPosition.middle,
        LineupPosition.back => api.LineupPosition.back,
      };
}
