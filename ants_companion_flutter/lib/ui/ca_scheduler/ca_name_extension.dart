class CaNames {
  static String get anthillDevelopment => 'Anthill Development';
  static String get colonyEvolution => 'Colony Evolution';
  static String get massDevelopment => 'Mass Development';
  static String get hatchSoldierAnts => 'Hatch Soldier Ants';
  static String get specialAntDevelopment => 'Special Ant Development';
}

extension ColonyActionName on String {
  String colonyActionName() {
    final list = switch (this) {
      // Monday
      '1-0' => CaNames.anthillDevelopment,
      '1-1' => CaNames.colonyEvolution,
      '1-2' => CaNames.anthillDevelopment,
      '1-3' => CaNames.massDevelopment,
      '1-4' => CaNames.anthillDevelopment,
      '1-5' => CaNames.anthillDevelopment,
      '1-6' => CaNames.massDevelopment,
      '1-7' => CaNames.massDevelopment,
      '1-8' => CaNames.anthillDevelopment,
      '1-9' => CaNames.colonyEvolution,
      '1-10' => CaNames.anthillDevelopment,
      '1-11' => CaNames.massDevelopment,
      '1-12' => CaNames.anthillDevelopment,
      '1-13' => CaNames.anthillDevelopment,
      '1-14' => CaNames.massDevelopment,
      '1-15' => CaNames.massDevelopment,
      '1-16' => CaNames.anthillDevelopment,
      '1-17' => CaNames.colonyEvolution,
      '1-18' => CaNames.anthillDevelopment,
      '1-19' => CaNames.massDevelopment,
      '1-20' => CaNames.anthillDevelopment,
      '1-21' => CaNames.anthillDevelopment,
      '1-22' => CaNames.massDevelopment,
      '1-23' => CaNames.massDevelopment,
      // Tuesday
      '2-0' => CaNames.anthillDevelopment,
      '2-1' => CaNames.anthillDevelopment,
      '2-2' => CaNames.hatchSoldierAnts,
      '2-3' => CaNames.anthillDevelopment,
      '2-4' => CaNames.massDevelopment,
      '2-5' => CaNames.massDevelopment,
      '2-6' => CaNames.massDevelopment,
      '2-7' => CaNames.anthillDevelopment,
      '2-8' => CaNames.anthillDevelopment,
      '2-9' => CaNames.anthillDevelopment,
      '2-10' => CaNames.hatchSoldierAnts,
      '2-11' => CaNames.anthillDevelopment,
      '2-12' => CaNames.massDevelopment,
      '2-13' => CaNames.massDevelopment,
      '2-14' => CaNames.massDevelopment,
      '2-15' => CaNames.anthillDevelopment,
      '2-16' => CaNames.anthillDevelopment,
      '2-17' => CaNames.anthillDevelopment,
      '2-18' => CaNames.hatchSoldierAnts,
      '2-19' => CaNames.anthillDevelopment,
      '2-20' => CaNames.massDevelopment,
      '2-21' => CaNames.massDevelopment,
      '2-22' => CaNames.massDevelopment,
      '2-23' => CaNames.anthillDevelopment,
      // Wednesday
      '3-0' => CaNames.anthillDevelopment,
      '3-1' => CaNames.colonyEvolution,
      '3-2' => CaNames.hatchSoldierAnts,
      '3-3' => CaNames.anthillDevelopment,
      '3-4' => CaNames.anthillDevelopment,
      '3-5' => CaNames.massDevelopment,
      '3-6' => CaNames.massDevelopment,
      '3-7' => CaNames.massDevelopment,
      '3-8' => CaNames.anthillDevelopment,
      '3-9' => CaNames.colonyEvolution,
      '3-10' => CaNames.hatchSoldierAnts,
      '3-11' => CaNames.anthillDevelopment,
      '3-12' => CaNames.anthillDevelopment,
      '3-13' => CaNames.massDevelopment,
      '3-14' => CaNames.massDevelopment,
      '3-15' => CaNames.massDevelopment,
      '3-16' => CaNames.anthillDevelopment,
      '3-17' => CaNames.colonyEvolution,
      '3-18' => CaNames.hatchSoldierAnts,
      '3-19' => CaNames.anthillDevelopment,
      '3-20' => CaNames.anthillDevelopment,
      '3-21' => CaNames.massDevelopment,
      '3-22' => CaNames.massDevelopment,
      '3-23' => CaNames.massDevelopment,
      // Thursday
      '4-0' => CaNames.anthillDevelopment,
      '4-1' => CaNames.specialAntDevelopment,
      '4-2' => CaNames.massDevelopment,
      '4-3' => CaNames.specialAntDevelopment,
      '4-4' => CaNames.massDevelopment,
      '4-5' => CaNames.specialAntDevelopment,
      '4-6' => CaNames.massDevelopment,
      '4-7' => CaNames.specialAntDevelopment,
      '4-8' => CaNames.anthillDevelopment,
      '4-9' => CaNames.specialAntDevelopment,
      '4-10' => CaNames.massDevelopment,
      '4-11' => CaNames.specialAntDevelopment,
      '4-12' => CaNames.massDevelopment,
      '4-13' => CaNames.specialAntDevelopment,
      '4-14' => CaNames.massDevelopment,
      '4-15' => CaNames.specialAntDevelopment,
      '4-16' => CaNames.anthillDevelopment,
      '4-17' => CaNames.specialAntDevelopment,
      '4-18' => CaNames.massDevelopment,
      '4-19' => CaNames.specialAntDevelopment,
      '4-20' => CaNames.massDevelopment,
      '4-21' => CaNames.specialAntDevelopment,
      '4-22' => CaNames.massDevelopment,
      '4-23' => CaNames.specialAntDevelopment,
      // Friday
      '5-0' => CaNames.massDevelopment,
      '5-1' => CaNames.massDevelopment,
      '5-2' => CaNames.massDevelopment,
      '5-3' => CaNames.hatchSoldierAnts,
      '5-4' => CaNames.massDevelopment,
      '5-5' => CaNames.anthillDevelopment,
      '5-6' => CaNames.colonyEvolution,
      '5-7' => CaNames.massDevelopment,
      '5-8' => CaNames.massDevelopment,
      '5-9' => CaNames.massDevelopment,
      '5-10' => CaNames.massDevelopment,
      '5-11' => CaNames.hatchSoldierAnts,
      '5-12' => CaNames.massDevelopment,
      '5-13' => CaNames.anthillDevelopment,
      '5-14' => CaNames.colonyEvolution,
      '5-15' => CaNames.massDevelopment,
      '5-16' => CaNames.massDevelopment,
      '5-17' => CaNames.massDevelopment,
      '5-18' => CaNames.massDevelopment,
      '5-19' => CaNames.hatchSoldierAnts,
      '5-20' => CaNames.massDevelopment,
      '5-21' => CaNames.anthillDevelopment,
      '5-22' => CaNames.colonyEvolution,
      '5-23' => CaNames.massDevelopment,
      // Saturday
      '6-0' => CaNames.massDevelopment,
      '6-1' => CaNames.colonyEvolution,
      '6-2' => CaNames.anthillDevelopment,
      '6-3' => CaNames.hatchSoldierAnts,
      '6-4' => CaNames.massDevelopment,
      '6-5' => CaNames.massDevelopment,
      '6-6' => CaNames.anthillDevelopment,
      '6-7' => CaNames.colonyEvolution,
      '6-8' => CaNames.massDevelopment,
      '6-9' => CaNames.colonyEvolution,
      '6-10' => CaNames.anthillDevelopment,
      '6-11' => CaNames.hatchSoldierAnts,
      '6-12' => CaNames.massDevelopment,
      '6-13' => CaNames.massDevelopment,
      '6-14' => CaNames.anthillDevelopment,
      '6-15' => CaNames.colonyEvolution,
      '6-16' => CaNames.massDevelopment,
      '6-17' => CaNames.colonyEvolution,
      '6-18' => CaNames.anthillDevelopment,
      '6-19' => CaNames.hatchSoldierAnts,
      '6-20' => CaNames.massDevelopment,
      '6-21' => CaNames.massDevelopment,
      '6-22' => CaNames.anthillDevelopment,
      '6-23' => CaNames.colonyEvolution,
      // Sunday
      '7-0' => CaNames.anthillDevelopment,
      '7-1' => CaNames.massDevelopment,
      '7-2' => CaNames.massDevelopment,
      '7-3' => CaNames.colonyEvolution,
      '7-4' => CaNames.massDevelopment,
      '7-5' => CaNames.hatchSoldierAnts,
      '7-6' => CaNames.massDevelopment,
      '7-7' => CaNames.massDevelopment,
      '7-8' => CaNames.anthillDevelopment,
      '7-9' => CaNames.massDevelopment,
      '7-10' => CaNames.massDevelopment,
      '7-11' => CaNames.colonyEvolution,
      '7-12' => CaNames.massDevelopment,
      '7-13' => CaNames.hatchSoldierAnts,
      '7-14' => CaNames.massDevelopment,
      '7-15' => CaNames.massDevelopment,
      '7-16' => CaNames.anthillDevelopment,
      '7-17' => CaNames.massDevelopment,
      '7-18' => CaNames.massDevelopment,
      '7-19' => CaNames.colonyEvolution,
      '7-20' => CaNames.massDevelopment,
      '7-21' => CaNames.hatchSoldierAnts,
      '7-22' => CaNames.massDevelopment,
      '7-23' => CaNames.massDevelopment,
      _ => 'Unknown Colony Action name'
    };

    return list;
  }
}
