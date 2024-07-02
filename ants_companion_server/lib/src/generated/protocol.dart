/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'ant.dart' as _i3;
import 'ant_role.dart' as _i4;
import 'ant_type.dart' as _i5;
import 'ants_theme.dart' as _i6;
import 'example.dart' as _i7;
import 'lineup_position.dart' as _i8;
import 'tier_rating.dart' as _i9;
import 'tier_tag.dart' as _i10;
import 'tier_tag_type.dart' as _i11;
import 'protocol.dart' as _i12;
import 'package:ants_companion_server/src/generated/ant.dart' as _i13;
import 'package:ants_companion_server/src/generated/tier_tag.dart' as _i14;
export 'ant.dart';
export 'ant_role.dart';
export 'ant_type.dart';
export 'ants_theme.dart';
export 'example.dart';
export 'lineup_position.dart';
export 'tier_rating.dart';
export 'tier_tag.dart';
export 'tier_tag_type.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'ant',
      dartName: 'Ant',
      schema: 'public',
      module: 'ants_companion',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ant_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:AntType',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:AntRole',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ant_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tier_tag',
      dartName: 'TierTag',
      schema: 'public',
      module: 'ants_companion',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tier_tag_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:TierTagType',
        ),
        _i2.ColumnDefinition(
          name: 'rating',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:TierRating',
        ),
        _i2.ColumnDefinition(
          name: 'position',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:LineupPosition',
        ),
        _i2.ColumnDefinition(
          name: 'reason',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'antId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'tier_tag_fk_0',
          columns: ['antId'],
          referenceTable: 'ant',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tier_tag_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Ant) {
      return _i3.Ant.fromJson(data) as T;
    }
    if (t == _i4.AntRole) {
      return _i4.AntRole.fromJson(data) as T;
    }
    if (t == _i5.AntType) {
      return _i5.AntType.fromJson(data) as T;
    }
    if (t == _i6.AntsTheme) {
      return _i6.AntsTheme.fromJson(data) as T;
    }
    if (t == _i7.Example) {
      return _i7.Example.fromJson(data) as T;
    }
    if (t == _i8.LineupPosition) {
      return _i8.LineupPosition.fromJson(data) as T;
    }
    if (t == _i9.TierRating) {
      return _i9.TierRating.fromJson(data) as T;
    }
    if (t == _i10.TierTag) {
      return _i10.TierTag.fromJson(data) as T;
    }
    if (t == _i11.TierTagType) {
      return _i11.TierTagType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Ant?>()) {
      return (data != null ? _i3.Ant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AntRole?>()) {
      return (data != null ? _i4.AntRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AntType?>()) {
      return (data != null ? _i5.AntType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AntsTheme?>()) {
      return (data != null ? _i6.AntsTheme.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Example?>()) {
      return (data != null ? _i7.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.LineupPosition?>()) {
      return (data != null ? _i8.LineupPosition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TierRating?>()) {
      return (data != null ? _i9.TierRating.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TierTag?>()) {
      return (data != null ? _i10.TierTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TierTagType?>()) {
      return (data != null ? _i11.TierTagType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i12.TierTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.TierTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i13.Ant>) {
      return (data as List).map((e) => deserialize<_i13.Ant>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.TierTag>) {
      return (data as List).map((e) => deserialize<_i14.TierTag>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Ant) {
      return 'Ant';
    }
    if (data is _i4.AntRole) {
      return 'AntRole';
    }
    if (data is _i5.AntType) {
      return 'AntType';
    }
    if (data is _i6.AntsTheme) {
      return 'AntsTheme';
    }
    if (data is _i7.Example) {
      return 'Example';
    }
    if (data is _i8.LineupPosition) {
      return 'LineupPosition';
    }
    if (data is _i9.TierRating) {
      return 'TierRating';
    }
    if (data is _i10.TierTag) {
      return 'TierTag';
    }
    if (data is _i11.TierTagType) {
      return 'TierTagType';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Ant') {
      return deserialize<_i3.Ant>(data['data']);
    }
    if (data['className'] == 'AntRole') {
      return deserialize<_i4.AntRole>(data['data']);
    }
    if (data['className'] == 'AntType') {
      return deserialize<_i5.AntType>(data['data']);
    }
    if (data['className'] == 'AntsTheme') {
      return deserialize<_i6.AntsTheme>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i7.Example>(data['data']);
    }
    if (data['className'] == 'LineupPosition') {
      return deserialize<_i8.LineupPosition>(data['data']);
    }
    if (data['className'] == 'TierRating') {
      return deserialize<_i9.TierRating>(data['data']);
    }
    if (data['className'] == 'TierTag') {
      return deserialize<_i10.TierTag>(data['data']);
    }
    if (data['className'] == 'TierTagType') {
      return deserialize<_i11.TierTagType>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.Ant:
        return _i3.Ant.t;
      case _i10.TierTag:
        return _i10.TierTag.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'ants_companion';
}
