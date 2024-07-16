/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AntUpdateData implements _i1.SerializableModel {
  AntUpdateData._({
    this.name,
    this.description,
  });

  factory AntUpdateData({
    String? name,
    String? description,
  }) = _AntUpdateDataImpl;

  factory AntUpdateData.fromJson(Map<String, dynamic> jsonSerialization) {
    return AntUpdateData(
      name: jsonSerialization['name'] as String?,
      description: jsonSerialization['description'] as String?,
    );
  }

  String? name;

  String? description;

  AntUpdateData copyWith({
    String? name,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AntUpdateDataImpl extends AntUpdateData {
  _AntUpdateDataImpl({
    String? name,
    String? description,
  }) : super._(
          name: name,
          description: description,
        );

  @override
  AntUpdateData copyWith({
    Object? name = _Undefined,
    Object? description = _Undefined,
  }) {
    return AntUpdateData(
      name: name is String? ? name : this.name,
      description: description is String? ? description : this.description,
    );
  }
}
