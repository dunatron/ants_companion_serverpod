import 'package:ants_companion_flutter/domain/colony_actions.dart/models/colony_action.dart';

class ColonyActions {
  const ColonyActions(this._provider);

  final ColonyActionsProvider _provider;

  Stream<List<ColonyAction>> weeklyList() => _provider.weeklyList();

  Stream<ColonyAction?> byKey(String key) => _provider.byKey(key);

  Future<void> updateColonyAction(ColonyAction item) =>
      _provider.updateColonyAction(item);
}

abstract class ColonyActionsProvider {
  Stream<List<ColonyAction>> weeklyList();

  Stream<ColonyAction?> byKey(String key);
  Future<void> updateColonyAction(ColonyAction item);
}
