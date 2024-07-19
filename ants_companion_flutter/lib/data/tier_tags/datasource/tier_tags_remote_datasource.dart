import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/core/log/loggers.dart';

class TierTagsRemoteDatasource {
  TierTagsRemoteDatasource(this._client);

  final Client _client;

  final logger = appLogger(TierTagsRemoteDatasource);

  Future<List<TierTag>> getAllTags() async {
    logger.d('Fetching all ants from remote');
    final tags = await _client.tierTags.all();
    logger.i('Retrieved ${tags.length} tags from remote');
    return tags;
  }

  Future<TierTag> create(final TierTag item) async {
    try {
      final createdItem = await _client.tierTags.create(item);
      logger.i('$item tier tag created.');
      return createdItem;
    } catch (e, s) {
      logger.e('Failed to create tier tag: $item', error: e, stackTrace: s);
      rethrow;
    }
  }
}
