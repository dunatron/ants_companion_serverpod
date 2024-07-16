import 'dart:typed_data';

import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:ants_companion_flutter/data/ants/datasource/ants_local_datasource.dart';
import 'package:ants_companion_flutter/data/ants/datasource/ants_remote_datasource.dart';
import 'package:ants_companion_flutter/data/ants/mappers/ant_mappers.dart';
import 'package:ants_companion_flutter/data/datasource.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';

abstract class IAntsDatasource extends Datasource {
  Future<List<Ant>> getAll();

  Future<Ant> create(final Ant ant);

  Future<Ant> update(final Ant ant);

  Future<void> delete(final String antId);

  // Future<String> setAntProfilePicture(
  //   String antId,
  //   String fileName,
  //   ByteData byteData,
  // );

  Future<String> setAntProfilePicture(
    String antId,
    String fileName,
    PlatformFile byteData,
  );
}

class AntsDatasource implements IAntsDatasource {
  AntsDatasource(this._remote, this._local);

  final AntsRemoteDatasource _remote;
  final AntsLocalDatasource _local;

  final Logger logger = appLogger(AntsDatasource);

  @override
  Future<List<Ant>> getAll() async {
    logger.d('Fetching ants from datasource.');

    final cachedAnts = await _local.getAll();
    if (cachedAnts.isNotEmpty) {
      logger.i('Returning ${cachedAnts.length} ants from cache');
      return cachedAnts.toDomain();
    }

    logger.i('No ants found in cache. Fetching from remote.');
    final remoteAnts = await _remote.getAll();

    for (var element in remoteAnts) {
      logger.d(element);
    }

    final ants = remoteAnts.toDomain();

    await _local.putAll(ants.toStoreModel());

    logger.i('Returning ${ants.length} ants from remote');

    return ants;
  }

  @override
  Future<Ant> create(final Ant ant) async {
    logger.d('Creating ant: ${ant.name}');

    // Send ant creation request to remote API
    final response = await _remote.create(ant.toApiModel());
    final createdAnt = response.toDomain();

    await _local.create(createdAnt.toStoreModel());

    logger.i('Returning created ant ${createdAnt.name}');

    return createdAnt;
  }

  @override
  Future<Ant> update(final Ant ant) async {
    logger.d('Updating ant: $ant');

    final response = await _remote.update(ant.toApiModel());
    final updatedAnt = response.toDomain();

    await _local.update(updatedAnt.toStoreModel());

    logger.i('Returning updated ant ${updatedAnt.name}');

    return updatedAnt;
  }

  @override
  resetCache() async {
    await _local.clearAllAnts();
  }

  @override
  Future<void> delete(String antId) async {
    final allAnts = await getAll();
    final antToDelete = allAnts.firstWhere((it) => it.id == antId);

    final deletedAnt = await _remote.delete(antToDelete.toApiModel());
    await _local.delete(antId);
  }

  // @override
  // Future<String> setAntProfilePicture(
  //   String antId,
  //   String fileName,
  //   ByteData byteData,
  // ) async {
  //   final publicUrl =
  //       await _remote.setProfilePicture(int.parse(antId), fileName, byteData);

  //   // ToDo: update the ant in the cache with the new image

  //   final antFromCache = _local.getAntById(antId);

  //   if (antFromCache != null) {
  //     // its a bit cumbersome. domain models would be nice as Hive objects..
  //     // maybe... separation has pros though too
  //     _local.update(
  //       antFromCache
  //           .toDomain()
  //           .copyWith(profilePictureUrl: publicUrl)
  //           .toStoreModel(),
  //     );
  //   }

  //   return publicUrl;
  // }

  @override
  Future<String> setAntProfilePicture(
    String antId,
    String fileName,
    PlatformFile byteData,
  ) async {
    final publicUrl =
        await _remote.setProfilePicture(int.parse(antId), fileName, byteData);

    // ToDo: update the ant in the cache with the new image

    final antFromCache = _local.getAntById(antId);

    if (antFromCache != null) {
      // its a bit cumbersome. domain models would be nice as Hive objects..
      // maybe... separation has pros though too
      _local.update(
        antFromCache
            .toDomain()
            .copyWith(profilePictureUrl: publicUrl)
            .toStoreModel(),
      );
    }

    return publicUrl;
  }
}
