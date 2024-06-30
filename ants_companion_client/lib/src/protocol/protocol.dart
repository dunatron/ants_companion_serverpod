/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'ant.dart' as _i2;
import 'ant_role.dart' as _i3;
import 'ant_type.dart' as _i4;
import 'ants_theme.dart' as _i5;
import 'example.dart' as _i6;
import 'lineup_position.dart' as _i7;
import 'tier_rating.dart' as _i8;
import 'tier_tag.dart' as _i9;
import 'protocol.dart' as _i10;
import 'package:ants_companion_client/src/protocol/ant.dart' as _i11;
import 'package:ants_companion_client/src/protocol/tier_tag.dart' as _i12;
export 'ant.dart';
export 'ant_role.dart';
export 'ant_type.dart';
export 'ants_theme.dart';
export 'example.dart';
export 'lineup_position.dart';
export 'tier_rating.dart';
export 'tier_tag.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Ant) {
      return _i2.Ant.fromJson(data) as T;
    }
    if (t == _i3.AntRole) {
      return _i3.AntRole.fromJson(data) as T;
    }
    if (t == _i4.AntType) {
      return _i4.AntType.fromJson(data) as T;
    }
    if (t == _i5.AntsTheme) {
      return _i5.AntsTheme.fromJson(data) as T;
    }
    if (t == _i6.Example) {
      return _i6.Example.fromJson(data) as T;
    }
    if (t == _i7.LineupPosition) {
      return _i7.LineupPosition.fromJson(data) as T;
    }
    if (t == _i8.TierRating) {
      return _i8.TierRating.fromJson(data) as T;
    }
    if (t == _i9.TierTag) {
      return _i9.TierTag.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Ant?>()) {
      return (data != null ? _i2.Ant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AntRole?>()) {
      return (data != null ? _i3.AntRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AntType?>()) {
      return (data != null ? _i4.AntType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AntsTheme?>()) {
      return (data != null ? _i5.AntsTheme.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Example?>()) {
      return (data != null ? _i6.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LineupPosition?>()) {
      return (data != null ? _i7.LineupPosition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.TierRating?>()) {
      return (data != null ? _i8.TierRating.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TierTag?>()) {
      return (data != null ? _i9.TierTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i10.TierTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.TierTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i11.Ant>) {
      return (data as List).map((e) => deserialize<_i11.Ant>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.TierTag>) {
      return (data as List).map((e) => deserialize<_i12.TierTag>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Ant) {
      return 'Ant';
    }
    if (data is _i3.AntRole) {
      return 'AntRole';
    }
    if (data is _i4.AntType) {
      return 'AntType';
    }
    if (data is _i5.AntsTheme) {
      return 'AntsTheme';
    }
    if (data is _i6.Example) {
      return 'Example';
    }
    if (data is _i7.LineupPosition) {
      return 'LineupPosition';
    }
    if (data is _i8.TierRating) {
      return 'TierRating';
    }
    if (data is _i9.TierTag) {
      return 'TierTag';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Ant') {
      return deserialize<_i2.Ant>(data['data']);
    }
    if (data['className'] == 'AntRole') {
      return deserialize<_i3.AntRole>(data['data']);
    }
    if (data['className'] == 'AntType') {
      return deserialize<_i4.AntType>(data['data']);
    }
    if (data['className'] == 'AntsTheme') {
      return deserialize<_i5.AntsTheme>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i6.Example>(data['data']);
    }
    if (data['className'] == 'LineupPosition') {
      return deserialize<_i7.LineupPosition>(data['data']);
    }
    if (data['className'] == 'TierRating') {
      return deserialize<_i8.TierRating>(data['data']);
    }
    if (data['className'] == 'TierTag') {
      return deserialize<_i9.TierTag>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
