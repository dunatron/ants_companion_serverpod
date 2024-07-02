/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class TierTag extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  TierTag._({
    int? id,
    required this.type,
    required this.rating,
    required this.position,
    required this.reason,
    required this.createdAt,
    required this.antId,
  }) : super(id);

  factory TierTag({
    int? id,
    required _i2.TierTagType type,
    required _i2.TierRating rating,
    required _i2.LineupPosition position,
    required String reason,
    required DateTime createdAt,
    required int antId,
  }) = _TierTagImpl;

  factory TierTag.fromJson(Map<String, dynamic> jsonSerialization) {
    return TierTag(
      id: jsonSerialization['id'] as int?,
      type: _i2.TierTagType.fromJson((jsonSerialization['type'] as int)),
      rating: _i2.TierRating.fromJson((jsonSerialization['rating'] as int)),
      position:
          _i2.LineupPosition.fromJson((jsonSerialization['position'] as int)),
      reason: jsonSerialization['reason'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      antId: jsonSerialization['antId'] as int,
    );
  }

  static final t = TierTagTable();

  static const db = TierTagRepository._();

  _i2.TierTagType type;

  _i2.TierRating rating;

  _i2.LineupPosition position;

  String reason;

  DateTime createdAt;

  int antId;

  @override
  _i1.Table get table => t;

  TierTag copyWith({
    int? id,
    _i2.TierTagType? type,
    _i2.TierRating? rating,
    _i2.LineupPosition? position,
    String? reason,
    DateTime? createdAt,
    int? antId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'rating': rating.toJson(),
      'position': position.toJson(),
      'reason': reason,
      'createdAt': createdAt.toJson(),
      'antId': antId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'rating': rating.toJson(),
      'position': position.toJson(),
      'reason': reason,
      'createdAt': createdAt.toJson(),
      'antId': antId,
    };
  }

  static TierTagInclude include() {
    return TierTagInclude._();
  }

  static TierTagIncludeList includeList({
    _i1.WhereExpressionBuilder<TierTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TierTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TierTagTable>? orderByList,
    TierTagInclude? include,
  }) {
    return TierTagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TierTag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TierTag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TierTagImpl extends TierTag {
  _TierTagImpl({
    int? id,
    required _i2.TierTagType type,
    required _i2.TierRating rating,
    required _i2.LineupPosition position,
    required String reason,
    required DateTime createdAt,
    required int antId,
  }) : super._(
          id: id,
          type: type,
          rating: rating,
          position: position,
          reason: reason,
          createdAt: createdAt,
          antId: antId,
        );

  @override
  TierTag copyWith({
    Object? id = _Undefined,
    _i2.TierTagType? type,
    _i2.TierRating? rating,
    _i2.LineupPosition? position,
    String? reason,
    DateTime? createdAt,
    int? antId,
  }) {
    return TierTag(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      rating: rating ?? this.rating,
      position: position ?? this.position,
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
      antId: antId ?? this.antId,
    );
  }
}

class TierTagTable extends _i1.Table {
  TierTagTable({super.tableRelation}) : super(tableName: 'tier_tag') {
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byIndex,
    );
    rating = _i1.ColumnEnum(
      'rating',
      this,
      _i1.EnumSerialization.byIndex,
    );
    position = _i1.ColumnEnum(
      'position',
      this,
      _i1.EnumSerialization.byIndex,
    );
    reason = _i1.ColumnString(
      'reason',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    antId = _i1.ColumnInt(
      'antId',
      this,
    );
  }

  late final _i1.ColumnEnum<_i2.TierTagType> type;

  late final _i1.ColumnEnum<_i2.TierRating> rating;

  late final _i1.ColumnEnum<_i2.LineupPosition> position;

  late final _i1.ColumnString reason;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt antId;

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        rating,
        position,
        reason,
        createdAt,
        antId,
      ];
}

class TierTagInclude extends _i1.IncludeObject {
  TierTagInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => TierTag.t;
}

class TierTagIncludeList extends _i1.IncludeList {
  TierTagIncludeList._({
    _i1.WhereExpressionBuilder<TierTagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TierTag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TierTag.t;
}

class TierTagRepository {
  const TierTagRepository._();

  Future<List<TierTag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TierTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TierTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TierTagTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TierTag>(
      where: where?.call(TierTag.t),
      orderBy: orderBy?.call(TierTag.t),
      orderByList: orderByList?.call(TierTag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<TierTag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TierTagTable>? where,
    int? offset,
    _i1.OrderByBuilder<TierTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TierTagTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TierTag>(
      where: where?.call(TierTag.t),
      orderBy: orderBy?.call(TierTag.t),
      orderByList: orderByList?.call(TierTag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<TierTag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TierTag>(
      id,
      transaction: transaction,
    );
  }

  Future<List<TierTag>> insert(
    _i1.Session session,
    List<TierTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TierTag>(
      rows,
      transaction: transaction,
    );
  }

  Future<TierTag> insertRow(
    _i1.Session session,
    TierTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TierTag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<TierTag>> update(
    _i1.Session session,
    List<TierTag> rows, {
    _i1.ColumnSelections<TierTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TierTag>(
      rows,
      columns: columns?.call(TierTag.t),
      transaction: transaction,
    );
  }

  Future<TierTag> updateRow(
    _i1.Session session,
    TierTag row, {
    _i1.ColumnSelections<TierTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TierTag>(
      row,
      columns: columns?.call(TierTag.t),
      transaction: transaction,
    );
  }

  Future<List<TierTag>> delete(
    _i1.Session session,
    List<TierTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TierTag>(
      rows,
      transaction: transaction,
    );
  }

  Future<TierTag> deleteRow(
    _i1.Session session,
    TierTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TierTag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<TierTag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TierTagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TierTag>(
      where: where(TierTag.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TierTagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TierTag>(
      where: where?.call(TierTag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
