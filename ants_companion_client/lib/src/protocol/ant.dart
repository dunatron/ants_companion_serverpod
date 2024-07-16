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

abstract class Ant implements _i1.SerializableModel {
  Ant._({
    this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.role,
    required this.createdAt,
    this.profilePictureUrl,
    this.tierTags,
  });

  factory Ant({
    int? id,
    required String name,
    required String description,
    required _i2.AntType type,
    required _i2.AntRole role,
    required DateTime createdAt,
    String? profilePictureUrl,
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
      profilePictureUrl: jsonSerialization['profilePictureUrl'] as String?,
      tierTags: (jsonSerialization['tierTags'] as List?)
          ?.map((e) => _i2.TierTag.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  _i2.AntType type;

  _i2.AntRole role;

  DateTime createdAt;

  String? profilePictureUrl;

  List<_i2.TierTag>? tierTags;

  Ant copyWith({
    int? id,
    String? name,
    String? description,
    _i2.AntType? type,
    _i2.AntRole? role,
    DateTime? createdAt,
    String? profilePictureUrl,
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
      if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
      if (tierTags != null)
        'tierTags': tierTags?.toJson(valueToJson: (v) => v.toJson()),
    };
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
    String? profilePictureUrl,
    List<_i2.TierTag>? tierTags,
  }) : super._(
          id: id,
          name: name,
          description: description,
          type: type,
          role: role,
          createdAt: createdAt,
          profilePictureUrl: profilePictureUrl,
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
    Object? profilePictureUrl = _Undefined,
    Object? tierTags = _Undefined,
  }) {
    return Ant(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      profilePictureUrl: profilePictureUrl is String?
          ? profilePictureUrl
          : this.profilePictureUrl,
      tierTags:
          tierTags is List<_i2.TierTag>? ? tierTags : this.tierTags?.clone(),
    );
  }
}
