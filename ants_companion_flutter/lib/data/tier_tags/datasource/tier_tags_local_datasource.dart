import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:ants_companion_flutter/data/exceptions/local_database_exception.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/ant_tier_tag.dart';
import 'package:hive/hive.dart';

class TierTagsLocalDatasource {
  TierTagsLocalDatasource(this._box);

  final Box<AntTierTag> _box;

  final logger = appLogger(TierTagsLocalDatasource);

  List<AntTierTag> getAll() {
    logger.d('Fetching tier tags from cache.');
    try {
      final tags = _box.values.toList();
      logger.i('Retrieved ${tags.length} tags from cache.');
      for (final tag in tags) {
        logger.d(tag);
      }
      return tags;
    } catch (e, s) {
      logger.e('Failed to get tags from cache: $e', error: e, stackTrace: s);
      throw LocalDatabaseException('Failed to get tags: $e');
    }
  }

  Future<void> putAll(List<AntTierTag> items) async {
    logger.d('Caching ${items.length} tier tags.');
    final Map<String, AntTierTag> itemMap = {
      for (var item in items) item.id: item,
    };
    await _box.putAll(itemMap);
    logger.i('Cached ${items.length} tier tags.');
  }

  Future<AntTierTag> create(final AntTierTag item) async {
    logger.d('Adding $item to cache.');
    await _box.put(item.id, item);
    logger.i('Cached $item.');
    return item;
  }

  Future<AntTierTag> update(final AntTierTag item) async {
    logger.d('Updating $item in cache.');
    await _box.put(item.id, item);
    logger.i('Cached $item');
    return item;
  }

  Future<void> delete(final String id) async {
    logger.d('deleting tier tag with id: $id in cache.');
    await _box.delete(id);
    logger.i('deleted item $id from cache.');
  }

  Future<void> clear() async {
    logger.d('Clearing tier tags cache.');

    try {
      await _box.clear();

      logger.i('Successfully cleared tier tags cache.');
    } on HiveError catch (e, s) {
      logger.e('Failed to clear tier tags cache.', error: e, stackTrace: s);
      throw LocalDatabaseException('Failed to clear tier tags cache');
    }
  }
}
