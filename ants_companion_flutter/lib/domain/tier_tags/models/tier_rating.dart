import 'package:flutter/material.dart';

enum TierRating {
  meta(
    order: 0,
    color: Colors.red,
  ),
  f2pMeta(
    order: 1,
    color: Colors.orange,
  ),
  s(
    order: 2,
    color: Colors.yellow,
  ),
  a(
    order: 3,
    color: Colors.purple,
  ),
  b(
    order: 4,
    color: Colors.blue,
  ),
  c(
    order: 5,
    color: Colors.green,
  ),
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
