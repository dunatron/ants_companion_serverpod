import 'package:ants_companion_flutter/domain/models/ant_type.dart';
import 'package:ants_companion_flutter/domain/models/lineup_position.dart';
import 'package:ants_companion_flutter/domain/models/tier_rating.dart';
import 'package:equatable/equatable.dart';

sealed class AntTierTag extends Equatable {
  const AntTierTag({
    required this.rating,
    required this.antType,
    required this.reason,
    required this.rowPosition,
  });

  final TierRating rating;
  final AntType antType;
  final String reason;
  final LineupPosition rowPosition;

  Map<String, dynamic> toMap() {
    return {
      'type': this is AntPveTierTag ? 'pve' : 'pvp',
      'rating': reason,
      'antType': antType.name,
      'reason': reason,
      'rowPosition': rowPosition.name,
    };
  }

  factory AntTierTag.fromMap(Map<String, dynamic> map) {
    // final type = map['type'] as String?;
    // final rating = TierRating.valueOf(map['rating'] ?? '');
    // final antType = AntType.valueOf(map['antType'] ?? '');
    // final reason = map['reason'] ?? '';
    // final rowPosition = LineupPosition.valueOf(map['rowPosition'] ?? '');

    return AntPveTierTag(
      rating: TierRating.a,
      antType: AntType.guardian,
      reason: 'reason',
      rowPosition: LineupPosition.front,
    );
  }

  @override
  List<Object?> get props => [rating, antType, reason, rowPosition];
}

class AntPveTierTag extends AntTierTag {
  const AntPveTierTag({
    required super.rating,
    required super.antType,
    required super.reason,
    required super.rowPosition,
  });

  @override
  List<Object?> get props => [rating, reason];
}

class AntPvpTierTag extends AntTierTag {
  const AntPvpTierTag({
    required super.rating,
    required super.reason,
    required super.antType,
    required super.rowPosition,
  });

  @override
  List<Object?> get props => [rating, reason, rowPosition];
}
