import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:ants_companion_flutter/data/exceptions/local_database_exception.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AntsLocalDatasource {
  AntsLocalDatasource(this._box);

  final Box<Ant> _box;

  final logger = appLogger(AntsLocalDatasource);

  Ant? getAntById(String id) {
    logger.d('getting ant by id.');

    final ant = _box.get(id);

    return ant;
  }

  List<Ant> getAll() {
    logger.d('Fetching ants from cache.');
    try {
      final ants = _box.values.toList();
      logger.i('Retrieved ${ants.length} ants from cache.');
      for (final ant in ants) {
        logger.d(ant);
      }
      return ants;
    } catch (e, s) {
      // logger.e('Failed to get ants from cache.');
      logger.e('Failed to get ants from cache: $e', error: e, stackTrace: s);
      throw LocalDatabaseException('Failed to get ants: $e');
    }
  }

  Future<void> putAll(List<Ant> ants) async {
    logger.d('Caching ${ants.length} ants.');
    final Map<String, Ant> antsMap = {
      for (var ant in ants) ant.id: ant,
    };
    await _box.putAll(antsMap);
    logger.i('Cached ${ants.length} ants.');
  }

  Future<Ant> create(final Ant ant) async {
    logger.d('Adding ${ant.name} to cache.');
    // await _box.add(ant);
    await _box.put(ant.id, ant);
    logger.i('Cached ${ant.name}.');
    return ant;
  }

  Future<Ant> update(final Ant ant) async {
    logger.d('Updating ${ant.name} in cache.');
    // await _box.add(ant);
    await _box.put(ant.id, ant);
    logger.i('Cached ${ant.name}.');
    return ant;
  }

  Future<void> delete(final String antId) async {
    logger.d('deleting ant with id: $antId in cache.');
    // await _box.add(ant);
    await _box.delete(antId);
    logger.i('deleted ant $antId from cache.');
  }

  Future<void> clearAllAnts() async {
    logger.d('Clearing ants cache.');

    // throw HiveError('LOLOLOL');

    try {
      // throw HiveError('LOLOLOL');
      // throw LocalDatabaseException('Failed to clear ants cache:');
      await _box.clear();

      logger.i('Successfully cleared ants cache.');
    } on HiveError catch (e, s) {
      logger.e('Failed to clear ants cache.', error: e, stackTrace: s);
      throw LocalDatabaseException('Failed to clear ants cache');
    }
  }
}
