import 'package:ants_companion_flutter/domain/ants/models/ant_role.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';
import 'package:equatable/equatable.dart';

class Ant extends Equatable {
  const Ant({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.role,
  });

  /// the unique id for the ant
  final String id;

  /// name of the ant
  final String name;

  /// description of the ant
  final String description;

  final AntType type;

  final AntRole role;

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

  @override
  List<Object?> get props => [id, name, type, role, description];
}
