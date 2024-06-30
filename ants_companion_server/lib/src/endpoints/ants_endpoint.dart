import 'package:ants_companion_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AntsEndpoint extends Endpoint {
  /// CREATE

  /// Create an ant record
  Future<Ant> create(Session session, Ant ant) async {
    try {
      final createdAnt = await Ant.db.insertRow(session, ant);

      return createdAnt;
    } catch (e) {
      print('Something went wrong creating the ant');
      print(e);
      throw Exception('boo');
    }
  }

  /// READ

  /// list of all ants in the database
  Future<List<Ant>> all(Session session) async {
    return await Ant.db.find(
      session,
      // include: AntInclude,
      include: Ant.include(
        tierTags: TierTag.includeList(),
      ),
    );
  }

  /// list of all ants in the database
  Future<Ant?> byId(Session session, int id) async {
    return await Ant.db.findById(session, id);
  }

  /// UPDATE

  /// update a an ant record in the database
  Future<Ant?> update(Session session, int antId) async {
    var ant = await Ant.db.findById(session, antId);

    if (ant == null) {
      return null;
    }
    ant.name = 'New name';
    final updatedAnt = await Ant.db.updateRow(session, ant);

    return updatedAnt;
  }

  /// DELETE

  /// delete an ant record in the database
  Future<Ant?> delete(Session session, int antId) async {
    var ant = await Ant.db.findById(session, antId);
    if (ant == null) {
      return null;
    }
    var deletedAnt = await Ant.db.deleteRow(session, ant);
    return deletedAnt;
  }
}
