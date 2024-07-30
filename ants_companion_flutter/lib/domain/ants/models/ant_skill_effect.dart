import 'package:equatable/equatable.dart';

class AntSKillEffect extends Equatable {
  const AntSKillEffect({
    required this.type,
    required this.chance,
    required this.power,
    required this.powerLevelMultiplier,
    required this.starredChance,
    required this.starredPower,
    required this.starredPowerLevelMultiplier,
  });

  final AntSkillEffectType type;

  final double chance;
  final double power;
  final double powerLevelMultiplier;

  final double starredChance;
  final double starredPower;
  final double starredPowerLevelMultiplier;

  @override
  List<Object?> get props => [];
}

enum AntSkillEffectType {
  buffSquadDefense,
  buffSquadAttack,
  attack,
  attackAndSuppress,
}
