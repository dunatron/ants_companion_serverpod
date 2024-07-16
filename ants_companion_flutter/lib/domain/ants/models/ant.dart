import 'package:ants_companion_flutter/domain/ants/models/ant_role.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';
import 'package:equatable/equatable.dart';

/// could seriously simplify it if we used freezed and hive here on our domain model
/// we would be transforming data less and reduce boiler plate code
class Ant extends Equatable {
  const Ant({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.role,
    this.profilePictureUrl,
  });

  /// the unique id for the ant
  final String id;

  /// name of the ant
  final String name;

  /// description of the ant
  final String description;

  final AntType type;

  final AntRole role;

  final String? profilePictureUrl;

  factory Ant.createNew({
    required String name,
    required String description,
    required AntType type,
    required AntRole role,
  }) {
    return Ant(
      id: '',
      type: type,
      role: role,
      name: name,
      description: description,
    );
  }

  Ant copyWith({
    String? name,
    String? description,
    AntType? type,
    AntRole? role,
    String? profilePictureUrl,
  }) {
    return Ant(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      role: role ?? this.role,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  @override
  List<Object?> get props => [id, name, type, role, description];
}
