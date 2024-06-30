import 'package:ants_companion_client/ants_companion_client.dart' as api;
import 'package:ants_companion_flutter/data/ants/mappers/ant_to_data.dart';
import 'package:ants_companion_flutter/data/ants/mappers/ant_to_domain.dart';
import 'package:ants_companion_flutter/data/ants/ant_store_serializer.dart';
import 'package:ants_companion_flutter/data/store/store_service.dart';
import 'package:ants_companion_flutter/domain/ants.dart';
import 'package:ants_companion_flutter/domain/models/ant.dart';

import 'package:rxdart/subjects.dart';

class AntsRepository implements AntsProvider {
  AntsRepository(
    this._client,
    this._storeService,
  );

  final api.Client _client;

  final StoreService _storeService;

  final antStoreSerializer = AntStoreSerializer();

  final _antsSubject = BehaviorSubject<List<api.Ant>>();

  @override
  Stream<List<Ant>> antsList() {
    if (!_antsSubject.hasValue) {
      final storedAnts = _storeService.getAll(antStoreSerializer);

      if (storedAnts.isNotEmpty) {
        _antsSubject.add(storedAnts);
      } else {
        _loadAnts();
      }
    }

    return _antsSubject.stream.map((it) => it.toDomain());
  }

  Future<void> _loadAnts() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final result = await _client.ants.all();

      _storeService.putAll(result, antStoreSerializer);

      _antsSubject.add(_storeService.getAll(antStoreSerializer));
      // _antsSubject.add(_alphabeticallySortedAnts(antsList));
    } catch (e) {
      _antsSubject.addError(e);
    }
  }

  @override
  Future<Ant?> antById(String id) async {
    final cachedAnt = _storeService.get(
      AntStoreSerializer.makeKey(id),
      antStoreSerializer,
    );
    return cachedAnt?.toDomain();
  }

  @override
  Future<Ant> createAnt(Ant ant) async {
    final response = await _client.ants.create(ant.toData());
    final createdAnt = response.toDomain();

    _storeService.put(createdAnt, antStoreSerializer);

    _antsSubject.add(_storeService.getAll(antStoreSerializer));

    return createdAnt;
  }

  @override
  Future<void> refresh() async {
    _storeService.clear();

    /// the below would effectively make the ants list empty
    _antsSubject.add(_storeService.getAll(antStoreSerializer));

    await Future.delayed(const Duration(seconds: 2));

    await _loadAnts();
  }
}
