import 'package:ants_companion_server/src/generated/tier_tag.dart';
import 'package:serverpod/serverpod.dart';

class TierTagsEndpoint extends Endpoint {
  /// CREATE

  /// create a new tier tag
  Future<TierTag> create(Session session, TierTag tag) async {
    return await TierTag.db.insertRow(session, tag);
  }

  /// READ

  /// get a list of all tier tags in the database
  Future<List<TierTag>> all(Session session, int antId) async {
    return await TierTag.db.find(
      session,
    );
  }

  /// get all the tier tags for an ant by the id
  Future<List<TierTag>> tierTagsByAntId(Session session, int antId) async {
    return await TierTag.db.find(
      session,
      where: (tag) => tag.antId.equals(antId),
    );
  }

  /// UPDATE

  /// update a tier tag
  Future<TierTag?> update(Session session, int tierTagId) async {
    var tierTag = await TierTag.db.findById(session, tierTagId);

    if (tierTag == null) {
      return null;
    }
    tierTag.reason = 'This becomes an S tier when';
    var updatedTag = await TierTag.db.updateRow(session, tierTag);

    return updatedTag;
  }

  /// DELETE

  /// delete a tier tag
  Future<TierTag?> delete(Session session, int tierTagId) async {
    var tierTag = await TierTag.db.findById(session, tierTagId);
    if (tierTag == null) {
      return null;
    }
    var deletedTierTag = await TierTag.db.deleteRow(session, tierTag);
    return deletedTierTag;
  }
}
