import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:ants_companion_flutter/data/datasource.dart';
import 'package:ants_companion_flutter/data/tier_tags/datasource/tier_tags_local_datasource.dart';
import 'package:ants_companion_flutter/data/tier_tags/datasource/tier_tags_remote_datasource.dart';
import 'package:ants_companion_flutter/data/tier_tags/mappers/tier_tag_mappers.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/ant_tier_tag.dart';

class TierTagsDatasource implements Datasource {
  TierTagsDatasource(this._remote, this._local);

  final TierTagsRemoteDatasource _remote;
  final TierTagsLocalDatasource _local;

  final logger = appLogger(TierTagsDatasource);

  Future<List<AntTierTag>> getAll() async {
    logger.d('Fetching ants from datasource.');

    final cachedItems = _local.getAll();
    if (cachedItems.isNotEmpty) {
      logger.i('Returning ${cachedItems.length} tier tags from cache');
      return cachedItems;
    }

    logger.i('No tier tags found in cache. Fetching from remote.');
    final remoteItems = await _remote.getAllTags();

    for (var item in remoteItems) {
      logger.d(item);
    }

    final items = remoteItems.toDomain();

    await _local.putAll(items);

    logger.i('Returning ${items.length} tier tags from remote');

    return items;
  }

  Future<AntTierTag> create(final AntTierTag item) async {
    logger.d('Creating tier tag: $item');

    // Send ant creation request to remote API
    final response = await _remote.create(item.toApiModel());
    final createdItem = response.toDomain();

    await _local.create(createdItem);

    logger.i('Returning created tier tag $createdItem');

    return createdItem;
  }

  @override
  resetCache() async {
    await _local.clear();
  }
}
