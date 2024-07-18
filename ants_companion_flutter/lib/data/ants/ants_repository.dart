import 'dart:typed_data';

import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:ants_companion_flutter/data/ants/datasource/ants_datasource.dart';
import 'package:ants_companion_flutter/data/exceptions/mappers/exception_mapper.dart';
import 'package:ants_companion_flutter/data/exceptions/run_catching_exceptions.dart';

import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:file_picker/file_picker.dart';

import 'package:rxdart/subjects.dart';

class AntsRepository implements AntsProvider {
  AntsRepository(this._datasource) {
    _loadAnts();
  }

  final AntsDatasource _datasource;

  final _antsSubject = BehaviorSubject<List<Ant>>();

  final logger = appLogger(AntsRepository);

  @override
  Stream<List<Ant>> antsList() {
    if (!_antsSubject.hasValue) {
      _loadAnts();
    }

    return _antsSubject.stream;
  }

  Future<void> _loadAnts() async {
    try {
      final newAnts = await _datasource.getAll();
      _antsSubject.add(newAnts);
    } on Exception catch (e) {
      final exception = e.toDomain();
      logger.w(exception);
      _antsSubject.addError(exception);
    }
  }

  @override
  Future<Ant?> antById(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    final ant = _antsSubject.stream.first
        .then((it) => it.firstWhere((element) => element.id == id));
    logger.d('Ant found by id: $ant');
    return ant;
  }

  @override
  Future<Ant> createAnt(Ant ant) async {
    final createdAnt =
        await runCatchingExceptions(() => _datasource.create(ant), logger);

    _antsSubject.value.add(createdAnt);
    _antsSubject.add(_antsSubject.value);

    return createdAnt;
  }

  @override
  Future<void> refresh() async {
    /// the below would effectively make the ants list empty for 2 seconds
    // _antsSubject.add(_storeService.getAll(antStoreSerializer));
    // await Future.delayed(const Duration(seconds: 2));
    await runCatchingExceptions(() => _datasource.resetCache(), logger);
    _loadAnts();
  }

  @override
  Future<Ant> updateAnt(Ant ant) async {
    final updatedAnt =
        await runCatchingExceptions(() => _datasource.update(ant), logger);

    // _antsSubject.value.add(updatedAnt);
    // _antsSubject.add(_antsSubject.value);

    final newAnts = await _datasource.getAll();
    _antsSubject.add(newAnts);

    return updatedAnt;
  }

  @override
  Future<Ant> deleteAnt(String antId) async {
    final allAnts = await _datasource.getAll();

    final antToDelete = allAnts.firstWhere((it) => it.id == antId);
    await _datasource.delete(antId);

    _loadAnts();

    return antToDelete;
  }

  // @override
  // Future<String> setAntProfilePicture(
  //   String antId,
  //   String fileName,
  //   ByteData byteData,
  // ) async {
  //   final publicUrl =
  //       await _datasource.setAntProfilePicture(antId, fileName, byteData);

  //   //We need to now update thebehaviour subject
  //   //  we can do this 1 of 2 ways.
  //   // loading ants data again as the cache should be updated...
  //   // or rely on this layer to update the data by updating the item in the lis
  //   // and reemitting

  //   _loadAnts();

  //   return publicUrl;
  // }

  @override
  Future<String> setAntProfilePicture(
    String antId,
    String fileName,
    PlatformFile byteData,
  ) async {
    final publicUrl =
        await _datasource.setAntProfilePicture(antId, fileName, byteData);

    //We need to now update thebehaviour subject
    //  we can do this 1 of 2 ways.
    // loading ants data again as the cache should be updated...
    // or rely on this layer to update the data by updating the item in the lis
    // and reemitting

    _loadAnts();

    return publicUrl;
  }
}
