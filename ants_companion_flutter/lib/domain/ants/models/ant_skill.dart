import 'package:ants_companion_flutter/domain/ants/models/ant_skill_effect.dart';
import 'package:equatable/equatable.dart';

class AntSkill extends Equatable {
  const AntSkill({
    required this.name,
    required this.type,
    required this.subType,
    required this.range,
    required this.effects,
  });

  final String name;

  final AntSKillType type;
  final AntSKillSubType subType;
  final List<AntSKillEffect> effects;

  /// clamp to 1-5
  final int range;

  @override
  List<Object?> get props => [];
}

enum AntSKillType { command, combat, preCombat }

enum AntSKillSubType {
  itsSquad,
  oneRandomEnemy,
  enemyFrontLine,
  allSquadsInTroop,
  threeRandomEnemy,
}

final slimArchedSkills = [
  const AntSkill(
    name: 'Dominance 3',
    type: AntSKillType.command,
    subType: AntSKillSubType.itsSquad,
    range: 5, // doesnt actually have this
    effects: [],
  ),
  const AntSkill(
    name: 'Big Bite',
    type: AntSKillType.combat,
    subType: AntSKillSubType.oneRandomEnemy,
    range: 2, // doesnt actually have this
    effects: [
      AntSKillEffect(
        type: AntSkillEffectType.attack,
        chance: 40,
        power: 275,
        powerLevelMultiplier: 5,
        starredChance: 50,
        starredPower: 275,
        starredPowerLevelMultiplier: 5,
      ),
    ],
  ),
  const AntSkill(
    name: 'Tertiary Defense',
    type: AntSKillType.command,
    subType: AntSKillSubType.allSquadsInTroop,
    range: 5, // doesnt actually have this
    effects: [
      AntSKillEffect(
        type: AntSkillEffectType.buffSquadDefense,

        /// WOuldnt really matter. they should be sealed classes
        /// but we have to store it into Hive which would get super tedious
        chance: 100, // should be Optional.
        power: 30,
        powerLevelMultiplier: 0, // should be Optional
        starredChance: 100, // should be Optional
        starredPower: 55,
        starredPowerLevelMultiplier: 5, // should be Optional
      ),
    ],
  ),
];
