import 'package:ants_companion_flutter/common/log/custom_logger.dart';
import 'package:ants_companion_flutter/data/ants/datasource/ants_local_datasource.dart';
import 'package:ants_companion_flutter/data/ants/datasource/ants_remote_datasource.dart';
import 'package:ants_companion_flutter/data/ants/mappers/ant_mappers.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:logger/logger.dart';

// https://codewithandrea.com/articles/flutter-exception-handling-try-catch-result-type/

/// Base Result class
/// [S] represents the type of the success value
sealed class Result<S> {
  const Result();
}

final class Success<S> extends Result<S> {
  const Success(this.value);
  final S value;
}

final class Failure<S> extends Result<S> {
  const Failure(this.exception);
  final Exception exception;
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);

  @override
  String toString() => 'DatabaseException: $message';
}

abstract class Datasource {
  resetCache() {}
}

abstract class IAntsDatasource extends Datasource {
  Future<List<Ant>> getAll();

  Future<Ant> create(final Ant ant);
}

class AntsDatasource implements IAntsDatasource {
  AntsDatasource(this._remote, this._local);

  final AntsRemoteDatasource _remote;
  final AntsLocalDatasource _local;

  final Logger logger = getLogger('AntsDatasource');

  @override
  Future<List<Ant>> getAll() async {
    try {
      logger.d('Fetching ants from cache.');
      final cachedAnts = await _local.getAll();
      if (cachedAnts.isNotEmpty) {
        logger.i('Retrieved ${cachedAnts.length} ants from cache.');
        return cachedAnts.toDomain();
      }

      logger.i('No ants found in cache. Fetching from remote.');
      final remoteAnts = await _remote.getAll();

      final ants = remoteAnts.toDomain();

      logger.d('Caching ${ants.length} ants fetched from remote.');
      await _local.putAll(ants.toStoreModel());

      logger.i('Successfully cached ${ants.length} ants from remote.');

      return ants;
    } catch (e, stackTrace) {
      logger.e('Failed to get ants.', error: e, stackTrace: stackTrace);
      rethrow;
      // throw DatabaseException('Failed to get Ants');
    }
  }

  @override
  Future<Ant> create(final Ant ant) async {
    logger.i('Creating ant: ${ant.name}');

    // Send ant creation request to remote API
    final response = await _remote.create(ant.toApiModel());
    final createdAnt = response.toDomain();

    // Cache the created ant locally
    await _local.create(createdAnt.toStoreModel());

    logger.i('Ant created successfully: ${createdAnt.name}');

    return createdAnt;
  }

  @override
  resetCache() {
    _local.clearAllAnts();
  }
}
