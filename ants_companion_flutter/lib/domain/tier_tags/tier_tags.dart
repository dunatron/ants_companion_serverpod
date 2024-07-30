import 'package:ants_companion_flutter/domain/tier_tags/models/ant_tier_tag.dart';

class TierTags {
  const TierTags(this._provider);

  final TierTagsProvider _provider;

  Stream<List<AntTierTag>> tierTags() => _provider.tierTags();

  Stream<List<AntTierTag>> tierTagsForAnt(final String antId) =>
      _provider.tierTagsForAnt(antId);

  Future<AntTierTag> create(AntTierTag tierTag) => _provider.create(tierTag);

  Future<void> refresh() => _provider.refresh();
}

abstract class TierTagsProvider {
  Stream<List<AntTierTag>> tierTags();

  Stream<List<AntTierTag>> tierTagsForAnt(final String antId);

  Future<AntTierTag> create(AntTierTag tierTag);

  Future<void> refresh();
}
