import 'package:ants_companion_flutter/data/ants/datasource/ants_datasource.dart';

import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';

import 'package:rxdart/subjects.dart';

class AntsRepository implements AntsProvider {
  AntsRepository(this._datasource);

  final AntsDatasource _datasource;

  final _antsSubject = BehaviorSubject<List<Ant>>();

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
    } catch (e) {
      _antsSubject.addError(e);
    }
  }

  @override
  Future<Ant?> antById(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<Ant> createAnt(Ant ant) async {
    final createdAnt = await _datasource.create(ant);

    _antsSubject.value.add(createdAnt);
    _antsSubject.add(_antsSubject.value);

    return createdAnt;
    // final response = await _client.ants.create(ant.toApiModel());
    // final createdAnt = response.toDomain();

    // _storeService.put(createdAnt, antStoreSerializer);

    // _antsSubject.add(_storeService.getAll(antStoreSerializer));

    // return createdAnt;
  }

  @override
  Future<void> refresh() async {
    _datasource.resetCache();
    // _storeService.clear();

    /// the below would effectively make the ants list empty
    // _antsSubject.add(_storeService.getAll(antStoreSerializer));

    await Future.delayed(const Duration(seconds: 2));

    await _loadAnts();
  }
}
