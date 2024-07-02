import 'package:ants_companion_flutter/domain/tier_tags/models/tier_tag.dart';

class TierTags {
  const TierTags(this._provider);

  final TierTagsProvider _provider;

  Stream<List<T>> tierTags<T extends TierTag>() => _provider.tierTags();

  Stream<List<AntTierTag>> tierTagsForAnt(final String antId) =>
      _provider.tierTagsForAnt(antId);

  Future<TierTag> create(TierTag tierTag) => _provider.create(tierTag);
}

abstract class TierTagsProvider {
  Stream<List<T>> tierTags<T extends TierTag>();

  Stream<List<AntTierTag>> tierTagsForAnt(final String antId);

  Future<TierTag> create(TierTag tierTag);
}
