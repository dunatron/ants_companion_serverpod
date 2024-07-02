import 'package:ants_companion_client/ants_companion_client.dart' as api;

import 'package:ants_companion_flutter/data/tier_tags/mappers/tier_tag_mappers.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_tag.dart';
import 'package:ants_companion_flutter/domain/tier_tags/tier_tags.dart';
import 'package:rxdart/subjects.dart';

class TierTagsRepository implements TierTagsProvider {
  TierTagsRepository(
    this._client,
  ) {
    _loadTags();
  }

  final api.Client _client;

  final _tagsSubject = BehaviorSubject<List<TierTag>>();

  _loadTags() async {
    final result = await _client.tierTags.all();
    _tagsSubject.add(result.map((e) => e.toDomain()).toList());
  }

  @override
  Future<TierTag> create(TierTag tierTag) async {
    final tierTagApiModel = tierTag.toApiModel();
    // TierTagToDomainExtension
    // final newTag = tierTag.fromDomain(antId);
    final createdTag = await _client.tierTags.create(tierTagApiModel);

    _tagsSubject.value.add(createdTag.toDomain());
    _tagsSubject.add(_tagsSubject.value);

    return createdTag.toDomain();
  }

  /// Stream of TierTag objects filtered by the specified type
  /// e.g. tierTags<AntTierTag>()
  @override
  Stream<List<T>> tierTags<T extends TierTag>() {
    if (!_tagsSubject.hasValue) {
      _loadTags();
    }
    return _tagsSubject.stream.map((tags) => tags.whereType<T>().toList());
  }

  @override
  Stream<List<AntTierTag>> tierTagsForAnt(String antId) =>
      _tagsSubject.stream.map(
        (tierTagsList) => tierTagsList
            .whereType<AntTierTag>()
            .where((tag) => tag.antId == antId)
            .toList(),
      );
}
