import 'package:flutter/material.dart';
import 'package:ants_companion_flutter/domain/_store_model_type_ids.dart';
import 'package:hive/hive.dart';

part 'tier_rating.g.dart';

@HiveType(typeId: StoreModelTypeIds.tierRating)
enum TierRating {
  @HiveField(0)
  meta(
    order: 0,
    color: Colors.red,
  ),
  @HiveField(1)
  f2pMeta(
    order: 1,
    color: Colors.orange,
  ),
  @HiveField(2)
  s(
    order: 2,
    color: Colors.yellow,
  ),
  @HiveField(3)
  a(
    order: 3,
    color: Colors.purple,
  ),
  @HiveField(4)
  b(
    order: 4,
    color: Colors.blue,
  ),
  @HiveField(5)
  c(
    order: 5,
    color: Colors.green,
  ),
  @HiveField(6)
  f(
    order: 6,
    color: Colors.grey,
  );

  const TierRating({
    required this.order,
    required this.color,
  });

  String get displayText => switch (this) {
        TierRating.meta => 'Meta',
        TierRating.f2pMeta => 'f2p Meta',
        TierRating.s => 'S',
        TierRating.a => 'A',
        TierRating.b => 'B',
        TierRating.c => 'C',
        TierRating.f => 'F',
      };

  final int order;
  final Color color;
}
