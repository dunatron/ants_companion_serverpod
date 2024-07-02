/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class TierTag implements _i1.SerializableModel {
  TierTag._({
    this.id,
    required this.type,
    required this.rating,
    required this.position,
    required this.reason,
    required this.createdAt,
    required this.antId,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.TierTagType type;

  _i2.TierRating rating;

  _i2.LineupPosition position;

  String reason;

  DateTime createdAt;

  int antId;

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
