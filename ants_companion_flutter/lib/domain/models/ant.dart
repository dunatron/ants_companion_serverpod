import 'package:ants_companion_flutter/domain/models/ant_tier_tag.dart';
import 'package:equatable/equatable.dart';

class Ant extends Equatable {
  const Ant({
    required this.id,
    required this.name,
    required this.description,
    required this.tierTags,
  });

  /// the unique id for the ant
  final String id;

  /// name of the ant
  final String name;

  /// description of the ant
  final String description;

  final List<AntTierTag> tierTags;

  factory Ant.createNew({
    required String name,
    required String description,
  }) {
    return Ant(
      id: '',
      name: name,
      description: description,
      tierTags: const [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tierTags': tierTags.map((it) => it.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [name, description];
}
