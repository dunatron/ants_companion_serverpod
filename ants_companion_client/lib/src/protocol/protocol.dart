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
import 'ant_update_data.dart' as _i5;
import 'ants_theme.dart' as _i6;
import 'example.dart' as _i7;
import 'exceptions/exception_type.dart' as _i8;
import 'exceptions/server_exception.dart' as _i9;
import 'lineup_position.dart' as _i10;
import 'tier_rating.dart' as _i11;
import 'tier_tag.dart' as _i12;
import 'tier_tag_type.dart' as _i13;
import 'protocol.dart' as _i14;
import 'package:ants_companion_client/src/protocol/ant.dart' as _i15;
import 'package:ants_companion_client/src/protocol/tier_tag.dart' as _i16;
export 'ant.dart';
export 'ant_role.dart';
export 'ant_type.dart';
export 'ant_update_data.dart';
export 'ants_theme.dart';
export 'example.dart';
export 'exceptions/exception_type.dart';
export 'exceptions/server_exception.dart';
export 'lineup_position.dart';
export 'tier_rating.dart';
export 'tier_tag.dart';
export 'tier_tag_type.dart';
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
    if (t == _i5.AntUpdateData) {
      return _i5.AntUpdateData.fromJson(data) as T;
    }
    if (t == _i6.AntsTheme) {
      return _i6.AntsTheme.fromJson(data) as T;
    }
    if (t == _i7.Example) {
      return _i7.Example.fromJson(data) as T;
    }
    if (t == _i8.ExceptionType) {
      return _i8.ExceptionType.fromJson(data) as T;
    }
    if (t == _i9.AntServerException) {
      return _i9.AntServerException.fromJson(data) as T;
    }
    if (t == _i10.LineupPosition) {
      return _i10.LineupPosition.fromJson(data) as T;
    }
    if (t == _i11.TierRating) {
      return _i11.TierRating.fromJson(data) as T;
    }
    if (t == _i12.TierTag) {
      return _i12.TierTag.fromJson(data) as T;
    }
    if (t == _i13.TierTagType) {
      return _i13.TierTagType.fromJson(data) as T;
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
    if (t == _i1.getType<_i5.AntUpdateData?>()) {
      return (data != null ? _i5.AntUpdateData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AntsTheme?>()) {
      return (data != null ? _i6.AntsTheme.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Example?>()) {
      return (data != null ? _i7.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ExceptionType?>()) {
      return (data != null ? _i8.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.AntServerException?>()) {
      return (data != null ? _i9.AntServerException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.LineupPosition?>()) {
      return (data != null ? _i10.LineupPosition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TierRating?>()) {
      return (data != null ? _i11.TierRating.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.TierTag?>()) {
      return (data != null ? _i12.TierTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TierTagType?>()) {
      return (data != null ? _i13.TierTagType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i14.TierTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.TierTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i15.Ant>) {
      return (data as List).map((e) => deserialize<_i15.Ant>(e)).toList()
          as dynamic;
    }
    if (t == List<_i16.TierTag>) {
      return (data as List).map((e) => deserialize<_i16.TierTag>(e)).toList()
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
    if (data is _i5.AntUpdateData) {
      return 'AntUpdateData';
    }
    if (data is _i6.AntsTheme) {
      return 'AntsTheme';
    }
    if (data is _i7.Example) {
      return 'Example';
    }
    if (data is _i8.ExceptionType) {
      return 'ExceptionType';
    }
    if (data is _i9.AntServerException) {
      return 'AntServerException';
    }
    if (data is _i10.LineupPosition) {
      return 'LineupPosition';
    }
    if (data is _i11.TierRating) {
      return 'TierRating';
    }
    if (data is _i12.TierTag) {
      return 'TierTag';
    }
    if (data is _i13.TierTagType) {
      return 'TierTagType';
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
    if (data['className'] == 'AntUpdateData') {
      return deserialize<_i5.AntUpdateData>(data['data']);
    }
    if (data['className'] == 'AntsTheme') {
      return deserialize<_i6.AntsTheme>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i7.Example>(data['data']);
    }
    if (data['className'] == 'ExceptionType') {
      return deserialize<_i8.ExceptionType>(data['data']);
    }
    if (data['className'] == 'AntServerException') {
      return deserialize<_i9.AntServerException>(data['data']);
    }
    if (data['className'] == 'LineupPosition') {
      return deserialize<_i10.LineupPosition>(data['data']);
    }
    if (data['className'] == 'TierRating') {
      return deserialize<_i11.TierRating>(data['data']);
    }
    if (data['className'] == 'TierTag') {
      return deserialize<_i12.TierTag>(data['data']);
    }
    if (data['className'] == 'TierTagType') {
      return deserialize<_i13.TierTagType>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
