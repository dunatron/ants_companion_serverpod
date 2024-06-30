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

abstract class Ant extends _i1.TableRow implements _i1.ProtocolSerialization {
  Ant._({
    int? id,
    required this.name,
    required this.description,
    required this.type,
    required this.role,
    required this.createdAt,
    this.tierTags,
  }) : super(id);

  factory Ant({
    int? id,
    required String name,
    required String description,
    required _i2.AntType type,
    required _i2.AntRole role,
    required DateTime createdAt,
    List<_i2.TierTag>? tierTags,
  }) = _AntImpl;

  factory Ant.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ant(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      type: _i2.AntType.fromJson((jsonSerialization['type'] as int)),
      role: _i2.AntRole.fromJson((jsonSerialization['role'] as int)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      tierTags: (jsonSerialization['tierTags'] as List?)
          ?.map((e) => _i2.TierTag.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = AntTable();

  static const db = AntRepository._();

  String name;

  String description;

  _i2.AntType type;

  _i2.AntRole role;

  DateTime createdAt;

  List<_i2.TierTag>? tierTags;

  @override
  _i1.Table get table => t;

  Ant copyWith({
    int? id,
    String? name,
    String? description,
    _i2.AntType? type,
    _i2.AntRole? role,
    DateTime? createdAt,
    List<_i2.TierTag>? tierTags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'type': type.toJson(),
      'role': role.toJson(),
      'createdAt': createdAt.toJson(),
      if (tierTags != null)
        'tierTags': tierTags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'type': type.toJson(),
      'role': role.toJson(),
      'createdAt': createdAt.toJson(),
      if (tierTags != null)
        'tierTags': tierTags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static AntInclude include({_i2.TierTagIncludeList? tierTags}) {
    return AntInclude._(tierTags: tierTags);
  }

  static AntIncludeList includeList({
    _i1.WhereExpressionBuilder<AntTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AntTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AntTable>? orderByList,
    AntInclude? include,
  }) {
    return AntIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Ant.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Ant.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AntImpl extends Ant {
  _AntImpl({
    int? id,
    required String name,
    required String description,
    required _i2.AntType type,
    required _i2.AntRole role,
    required DateTime createdAt,
    List<_i2.TierTag>? tierTags,
  }) : super._(
          id: id,
          name: name,
          description: description,
          type: type,
          role: role,
          createdAt: createdAt,
          tierTags: tierTags,
        );

  @override
  Ant copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    _i2.AntType? type,
    _i2.AntRole? role,
    DateTime? createdAt,
    Object? tierTags = _Undefined,
  }) {
    return Ant(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      tierTags:
          tierTags is List<_i2.TierTag>? ? tierTags : this.tierTags?.clone(),
    );
  }
}

class AntTable extends _i1.Table {
  AntTable({super.tableRelation}) : super(tableName: 'ant') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byIndex,
    );
    role = _i1.ColumnEnum(
      'role',
      this,
      _i1.EnumSerialization.byIndex,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnEnum<_i2.AntType> type;

  late final _i1.ColumnEnum<_i2.AntRole> role;

  late final _i1.ColumnDateTime createdAt;

  _i2.TierTagTable? ___tierTags;

  _i1.ManyRelation<_i2.TierTagTable>? _tierTags;

  _i2.TierTagTable get __tierTags {
    if (___tierTags != null) return ___tierTags!;
    ___tierTags = _i1.createRelationTable(
      relationFieldName: '__tierTags',
      field: Ant.t.id,
      foreignField: _i2.TierTag.t.antId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TierTagTable(tableRelation: foreignTableRelation),
    );
    return ___tierTags!;
  }

  _i1.ManyRelation<_i2.TierTagTable> get tierTags {
    if (_tierTags != null) return _tierTags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'tierTags',
      field: Ant.t.id,
      foreignField: _i2.TierTag.t.antId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TierTagTable(tableRelation: foreignTableRelation),
    );
    _tierTags = _i1.ManyRelation<_i2.TierTagTable>(
      tableWithRelations: relationTable,
      table: _i2.TierTagTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _tierTags!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        type,
        role,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'tierTags') {
      return __tierTags;
    }
    return null;
  }
}

class AntInclude extends _i1.IncludeObject {
  AntInclude._({_i2.TierTagIncludeList? tierTags}) {
    _tierTags = tierTags;
  }

  _i2.TierTagIncludeList? _tierTags;

  @override
  Map<String, _i1.Include?> get includes => {'tierTags': _tierTags};

  @override
  _i1.Table get table => Ant.t;
}

class AntIncludeList extends _i1.IncludeList {
  AntIncludeList._({
    _i1.WhereExpressionBuilder<AntTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Ant.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Ant.t;
}

class AntRepository {
  const AntRepository._();

  final attach = const AntAttachRepository._();

  final attachRow = const AntAttachRowRepository._();

  Future<List<Ant>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AntTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AntTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AntTable>? orderByList,
    _i1.Transaction? transaction,
    AntInclude? include,
  }) async {
    return session.db.find<Ant>(
      where: where?.call(Ant.t),
      orderBy: orderBy?.call(Ant.t),
      orderByList: orderByList?.call(Ant.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Ant?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AntTable>? where,
    int? offset,
    _i1.OrderByBuilder<AntTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AntTable>? orderByList,
    _i1.Transaction? transaction,
    AntInclude? include,
  }) async {
    return session.db.findFirstRow<Ant>(
      where: where?.call(Ant.t),
      orderBy: orderBy?.call(Ant.t),
      orderByList: orderByList?.call(Ant.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Ant?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AntInclude? include,
  }) async {
    return session.db.findById<Ant>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Ant>> insert(
    _i1.Session session,
    List<Ant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Ant>(
      rows,
      transaction: transaction,
    );
  }

  Future<Ant> insertRow(
    _i1.Session session,
    Ant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Ant>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Ant>> update(
    _i1.Session session,
    List<Ant> rows, {
    _i1.ColumnSelections<AntTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Ant>(
      rows,
      columns: columns?.call(Ant.t),
      transaction: transaction,
    );
  }

  Future<Ant> updateRow(
    _i1.Session session,
    Ant row, {
    _i1.ColumnSelections<AntTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Ant>(
      row,
      columns: columns?.call(Ant.t),
      transaction: transaction,
    );
  }

  Future<List<Ant>> delete(
    _i1.Session session,
    List<Ant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Ant>(
      rows,
      transaction: transaction,
    );
  }

  Future<Ant> deleteRow(
    _i1.Session session,
    Ant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Ant>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Ant>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AntTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Ant>(
      where: where(Ant.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AntTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Ant>(
      where: where?.call(Ant.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AntAttachRepository {
  const AntAttachRepository._();

  Future<void> tierTags(
    _i1.Session session,
    Ant ant,
    List<_i2.TierTag> tierTag,
  ) async {
    if (tierTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('tierTag.id');
    }
    if (ant.id == null) {
      throw ArgumentError.notNull('ant.id');
    }

    var $tierTag = tierTag.map((e) => e.copyWith(antId: ant.id)).toList();
    await session.db.update<_i2.TierTag>(
      $tierTag,
      columns: [_i2.TierTag.t.antId],
    );
  }
}

class AntAttachRowRepository {
  const AntAttachRowRepository._();

  Future<void> tierTags(
    _i1.Session session,
    Ant ant,
    _i2.TierTag tierTag,
  ) async {
    if (tierTag.id == null) {
      throw ArgumentError.notNull('tierTag.id');
    }
    if (ant.id == null) {
      throw ArgumentError.notNull('ant.id');
    }

    var $tierTag = tierTag.copyWith(antId: ant.id);
    await session.db.updateRow<_i2.TierTag>(
      $tierTag,
      columns: [_i2.TierTag.t.antId],
    );
  }
}
