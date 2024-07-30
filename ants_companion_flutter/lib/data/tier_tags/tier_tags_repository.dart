import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:ants_companion_flutter/data/exceptions/mappers/exception_mapper.dart';
import 'package:ants_companion_flutter/data/exceptions/run_catching_exceptions.dart';
import 'package:ants_companion_flutter/data/tier_tags/datasource/tier_tags_datasource.dart';

import 'package:ants_companion_flutter/domain/tier_tags/models/ant_tier_tag.dart';
import 'package:ants_companion_flutter/domain/tier_tags/tier_tags.dart';
import 'package:rxdart/subjects.dart';

class TierTagsRepository implements TierTagsProvider {
  TierTagsRepository(this._datasource) {
    _loadTags();
  }

  final TierTagsDatasource _datasource;

  final logger = appLogger(TierTagsRepository);

  final _tagsSubject = BehaviorSubject<List<AntTierTag>>();

  _loadTags() async {
    // _tagsSubject.addError(Exception('Booo'));
    try {
      final result = await _datasource.getAll();
      _tagsSubject.add(result);
    } on Exception catch (e) {
      final exception = e.toDomain();
      logger.w(exception);
      _tagsSubject.addError(exception);
    }
  }

  @override
  Future<AntTierTag> create(AntTierTag tierTag) async {
    final created =
        await runCatchingExceptions(() => _datasource.create(tierTag), logger);

    _tagsSubject.value.add(created);
    _tagsSubject.add(_tagsSubject.value);

    return created;
  }

  /// Stream of TierTag
  @override
  Stream<List<AntTierTag>> tierTags() {
    if (!_tagsSubject.hasValue) {
      _loadTags();
    }
    return _tagsSubject.stream.map((tags) => tags.toList());
  }

  @override
  Stream<List<AntTierTag>> tierTagsForAnt(String antId) =>
      _tagsSubject.stream.map(
        (tierTagsList) =>
            tierTagsList.where((tag) => tag.antId == antId).toList(),
      );

  @override
  Future<void> refresh() async {
    _datasource.resetCache();
    _loadTags();
  }
}
