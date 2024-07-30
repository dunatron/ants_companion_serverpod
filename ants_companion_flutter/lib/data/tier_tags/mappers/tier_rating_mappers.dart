import 'package:ants_companion_client/ants_companion_client.dart' as api;
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';

extension TierRatingFromDomainExtension on TierRating {
  api.TierRating toApiModel() => switch (this) {
        TierRating.meta => api.TierRating.meta,
        TierRating.f2pMeta => api.TierRating.f2pMeta,
        TierRating.s => api.TierRating.s,
        TierRating.a => api.TierRating.a,
        TierRating.b => api.TierRating.b,
        TierRating.c => api.TierRating.c,
        TierRating.f => api.TierRating.f,
      };
}

extension TierRatingToDomainExtension on api.TierRating {
  TierRating toDomain() => switch (this) {
        api.TierRating.meta => TierRating.meta,
        api.TierRating.f2pMeta => TierRating.f2pMeta,
        api.TierRating.s => TierRating.s,
        api.TierRating.a => TierRating.a,
        api.TierRating.b => TierRating.b,
        api.TierRating.c => TierRating.c,
        api.TierRating.f => TierRating.f,
      };
}
