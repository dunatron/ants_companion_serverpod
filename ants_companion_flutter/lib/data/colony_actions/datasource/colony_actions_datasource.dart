import 'package:ants_companion_flutter/data/colony_actions/datasource/colony_actions_local_datasource.dart';
import 'package:ants_companion_flutter/domain/colony_actions.dart/models/colony_action.dart';

class ColonyActionsDatasource {
  ColonyActionsDatasource(this._local);
  final ColonyActionsLocalDatasource _local;

  List<ColonyAction> allColonyActions() {
    final items = _local.getAll();
    return items;
  }

  Future<void> addColonyActions(List<ColonyAction> items) async {
    await _local.putAll(items);
  }

  Future<void> updateColonyAction(ColonyAction item) async {
    await _local.update(item);
  }
}
