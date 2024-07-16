import 'package:ants_companion_flutter/domain/tier_tags/models/lineup_position.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';
import 'package:equatable/equatable.dart';

sealed class TierTag extends Equatable {
  const TierTag({required this.rating, required this.reason});

  final TierRating rating;
  final String reason;

  @override
  List<Object?> get props => [rating, reason];
}

sealed class AntTierTag extends TierTag {
  const AntTierTag({
    required this.antId,
    required this.lineupPosition,
    required super.rating,
    required super.reason,
  });

  final String antId;
  final LineupPosition lineupPosition;

  @override
  List<Object?> get props => [antId, rating, reason, lineupPosition];
}

class AntPveTierTag extends AntTierTag {
  const AntPveTierTag({
    required super.antId,
    required super.rating,
    required super.reason,
    required super.lineupPosition,
  });

  @override
  List<Object?> get props => [rating, reason];
}

class AntPvpTierTag extends AntTierTag {
  const AntPvpTierTag({
    required super.antId,
    required super.rating,
    required super.reason,
    required super.lineupPosition,
  });

  @override
  List<Object?> get props => [rating, reason, lineupPosition];
}
