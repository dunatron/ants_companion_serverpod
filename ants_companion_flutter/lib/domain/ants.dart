import 'package:ants_companion_flutter/domain/models/ant.dart';

class Ants {
  const Ants(this._provider);
  final AntsProvider _provider;

  Stream<List<Ant>> antsList() => _provider.antsList().map(
        (it) => it.alphabeticallySorted(),
      );

  Future<Ant?> antById(String id) => _provider.antById(id);

  Future<Ant> createAnt(Ant ant) => _provider.createAnt(ant);

  Future<void> refresh() => _provider.refresh();
}

abstract class AntsProvider {
  Stream<List<Ant>> antsList();

  Future<Ant?> antById(String id);

  Future<Ant> createAnt(Ant ant);

  Future<void> refresh();
}

extension on List<Ant> {
  List<Ant> alphabeticallySorted() {
    final sortedList = [...this];
    sortedList.sort((a, b) => a.name.compareTo(b.name));
    return sortedList;
  }
}
