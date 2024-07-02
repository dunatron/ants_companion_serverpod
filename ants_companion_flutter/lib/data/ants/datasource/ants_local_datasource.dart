import 'package:ants_companion_flutter/data/ants/models/ant.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AntsLocalDatasource {
  const AntsLocalDatasource(this._box);

  final Box<Ant> _box;

  // Future<void> init() async {
  //   _box = await Hive.openBox<AntDto>(_boxName);
  // }

  Future<List<Ant>> getAll() async {
    return _box.values.toList();
  }

  Future<void> putAll(List<Ant> ants) async {
    final Map<String, Ant> antsMap = {
      for (var ant in ants) ant.id: ant,
    };
    await _box.putAll(antsMap);
  }

  Future<Ant> create(final Ant ant) async {
    await _box.add(ant);
    return ant;
  }

  Future<void> clearAllAnts() async {
    await _box.clear();
  }
}
