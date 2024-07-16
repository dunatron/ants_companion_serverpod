import 'dart:mirrors';

import 'package:ants_companion_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

extension MyExtension on Ant {
  bool isCustomMethod() {
    return true;
  }
}

class AntsEndpoint extends Endpoint {
  /// CREATE

  /// Create an ant record
  Future<Ant> create(Session session, Ant ant) async {
    try {
      /// get all the current names
      final allAnts = await Ant.db.find(session);
      if (allAnts.map((e) => e.name).contains(ant.name)) {
        throw AntServerException(
          message: 'Ant name already exists: ${ant.name}',
          errorType: ExceptionType.ConflictException,
        );
      }

      final createdAnt = await Ant.db.insertRow(session, ant);

      return createdAnt;
    } catch (e) {
      // ToDo: log here
      rethrow;
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
  Future<Ant?> update(
    Session session,
    int antId,
    AntUpdateData data,
  ) async {
    print('ANtId: $antId');
    print(data);
    var ant = await Ant.db.findById(session, antId);

    if (ant == null) {
      return null;
    }

    ant
      ..name = data.name ?? ant.name
      ..description = data.description ?? ant.description;

    final updatedAnt = await Ant.db.updateRow(
      session,
      ant,
    );

    // Ant.db.update(session, rows)

    return updatedAnt;
  }

  /// DELETE

  /// delete an ant record in the database
  Future<Ant?> delete(Session session, int antId) async {
    print('Delete ant with id: $antId');
    var ant = await Ant.db.findById(session, antId);
    if (ant == null) {
      return null;
    }
    var deletedAnt = await Ant.db.deleteRow(session, ant);
    return deletedAnt;
  }

  Future<String?> getUploadDescription(Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<void> setProfilePicture(
    Session session,
    int antId,
    String fileName,
  ) async {
    var ant = await Ant.db.findById(session, antId);
    if (ant != null) {
      ant.profilePictureUrl = fileName;
      await Ant.db.updateRow(session, ant);
    }
  }

  Future<String?> getProfileUrl(
    Session session,
    String path,
  ) async {
    var uri = await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    );

    return uri.toString();
  }
}
