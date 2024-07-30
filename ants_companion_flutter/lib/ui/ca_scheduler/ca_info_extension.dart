class CATask {
  CATask(this.title, this.points);

  final String title;
  final int points;

  static CATask get buildingPower => CATask('Building Power +1', 1000);

  static CATask get enhancementPower =>
      CATask('Enhance Building Power +1', 1000);

  static CATask get evolutionPower => CATask('Evolution Power +1', 400);
  static CATask get speedupEvolving =>
      CATask('each use of 1 min speedup when evolving', 400);
  static CATask get consumeBioEssence => CATask('Building Power +1', 25000);

  static CATask get consumeSpecialHypha =>
      CATask('Consume a Special Hypha', 10000);

  static CATask get consumeHypha => CATask('Consume a Hypha', 2000);

  static List<CATask> get consumeFungusList =>
      List.generate(4, (index) => CATask.consumeFungus(index + 1));

  static CATask consumeFungus(int tier) => CATask(
        'Consume a Fungus Nutrient $tier',
        switch (tier) { 1 => 200, 2 => 1000, 3 => 4000, 4 => 10000, _ => 200 },
      );

  static List<CATask> get obtainCellList =>
      List.generate(6, (index) => CATask.obtainCell(index + 2));

  static CATask obtainCell(int tier) => CATask(
        'Obtain a $tier-Star Cell',
        switch (tier) {
          2 => 10000,
          3 => 100000,
          4 => 600000,
          5 => 2400000,
          6 => 5000000,
          7 => 10000000,
          _ => 0
        },
      );

  static List<CATask> get consumeCellList =>
      List.generate(6, (index) => CATask.consumeCell(index + 2));

  static CATask consumeCell(int tier) => CATask(
        'Consume a $tier-Star Cell',
        switch (tier) {
          2 => 6000,
          3 => 60000,
          4 => 400000,
          5 => 1600000,
          6 => 3500000,
          7 => 7000000,
          _ => 0
        },
      );

  static CATask get speedupAny => CATask('Each use of any 1 min speedup', 400);

  static CATask get speedupBuilding =>
      CATask('Each use of 1 min Speedup when upgrading buildings', 900);

  static CATask get speedupBuildingEnhancement =>
      CATask('Each use of 1 min Speedup when enhancing buildings', 900);

  static CATask get speedupHatchingSoldiers =>
      CATask('Each use of 1 min Speedup when hatching Soldier Ants', 400);

  static List<CATask> get hatchSoldierAntsList =>
      List.generate(10, (index) => CATask.hatchSoldierAnt(index + 1));

  static CATask hatchSoldierAnt(int tier) => CATask(
        'Hatch a T-$tier Soldier Ant',
        switch (tier) {
          1 => 5,
          2 => 25,
          3 => 50,
          4 => 65,
          5 => 90,
          6 => 115,
          7 => 140,
          8 => 165,
          9 => 190,
          10 => 215,
          _ => 0
        },
      );

  static List<CATask> get consumeCellFluidList =>
      List.generate(4, (index) => CATask.consumeCellFluid(index + 1));

  static CATask consumeCellFluid(int tier) => CATask(
        'Consume 1 cell fluid T-$tier',
        switch (tier) { 1 => 200, 2 => 1000, 3 => 4000, 4 => 10000, _ => 0 },
      );

  static CATask get consumeCreatureRemain =>
      CATask('Use 1 creature remain', 700);

  static CATask get consumeSpore => CATask('Use 1 spore', 2000);

  static CATask get redeemSpore =>
      CATask('Redeem for 1 spore [from mutation pool]', 1000);

  static List<CATask> get consumeEggs => [
        CATask('Use 1 Time-limited Egg', 200000),
        CATask('Use 1 Tertiary Egg', 200000),
        CATask('Use 1 Secondary Egg', 50000),
        CATask('Use 1 Primary Egg', 10000),
        CATask('Use 1 Season Egg', 200000),
      ];

  static CATask get unlockSpecialAntSkill =>
      CATask('Unlock 1 skill for any Special Ant', 20000);

  static CATask get specialAntExperience => CATask('Special Ant EXP +10', 1);

  static List<CATask> get starUpSpecialAntsList =>
      List.generate(8, (index) => CATask.starUpSpecialAnts(index + 1));

  static CATask starUpSpecialAnts(int star) => CATask(
        'Star up special ant to $star-Star',
        switch (star) {
          1 => 1500000,
          2 => 2000000,
          3 => 2500000,
          4 => 3000000,
          5 => 3500000,
          6 => 4000000,
          7 => 4800000,
          8 => 6000000,
          _ => 0
        },
      );

  static List<CATask> get obtainGeneList =>
      List.generate(9, (index) => CATask.obtainGene(index + 2));

  static CATask obtainGene(int tier) => CATask(
        'Obtain a $tier-Star Gene',
        switch (tier) {
          2 => 10000,
          3 => 40000,
          4 => 100000,
          5 => 250000,
          6 => 500000,
          7 => 1200000,
          8 => 2100000,
          9 => 3200000,
          10 => 4500000,
          _ => 0
        },
      );

  static List<CATask> get consumeGeneList =>
      List.generate(9, (index) => CATask.consumeGene(index + 2));

  static CATask consumeGene(int tier) => CATask(
        'Consume a $tier-Star Gene',
        switch (tier) {
          2 => 6000,
          3 => 24000,
          4 => 60000,
          5 => 150000,
          6 => 300000,
          7 => 800000,
          8 => 1400000,
          9 => 2240000,
          10 => 3150000,
          _ => 0
        },
      );

  static List<CATask> get consumeGeneticFactorList =>
      List.generate(4, (index) => CATask.consumeGeneticFactor(index + 1));

  static CATask consumeGeneticFactor(int tier) => CATask(
        'Consume a Genetic Factor T-$tier',
        switch (tier) { 1 => 200, 2 => 1000, 3 => 4000, 4 => 10000, _ => 0 },
      );

  static List<CATask> get obtainGermList =>
      List.generate(9, (index) => CATask.obtainGerm(index + 2));

  static CATask obtainGerm(int tier) => CATask(
        'Obtain a $tier-Star Germ',
        switch (tier) {
          2 => 10000,
          3 => 40000,
          4 => 100000,
          5 => 250000,
          6 => 500000,
          7 => 1200000,
          8 => 2100000,
          9 => 3200000,
          10 => 4500000,
          _ => 0
        },
      );

  static List<CATask> get consumeGermList =>
      List.generate(9, (index) => CATask.consumeGerm(index + 2));

  static CATask consumeGerm(int tier) => CATask(
        'Consume a $tier-Star Germ',
        switch (tier) {
          2 => 6000,
          3 => 24000,
          4 => 60000,
          5 => 150000,
          6 => 300000,
          7 => 800000,
          8 => 1400000,
          9 => 2240000,
          10 => 3150000,
          _ => 0
        },
      );

  static List<CATask> get consumeGermMediumList =>
      List.generate(4, (index) => CATask.consumeGermMedium(index + 1));

  static CATask consumeGermMedium(int tier) => CATask(
        'Consume a Germ Medium T-$tier',
        switch (tier) { 1 => 200, 2 => 1000, 3 => 4000, 4 => 10000, _ => 0 },
      );

  static List<CATask> colonyActionTaskList(String caKey) => switch (caKey) {
        // Monday
        '1-0' || '1-8' || '1-16' => monday1,
        '1-1' || '1-9' || '1-17' => monday2,
        '1-2' || '1-10' || '1-18' => monday3,
        '1-3' || '1-11' || '1-19' => monday4,
        '1-4' || '1-12' || '1-20' => monday5,
        '1-5' || '1-13' || '1-21' => monday6,
        '1-6' || '1-14' || '1-22' => monday7,
        '1-7' || '1-15' || '1-23' => monday8,
        // Tuesday
        '2-0' || '2-8' || '2-16' => tuesday1,
        '2-1' || '2-9' || '2-17' => tuesday2,
        '2-2' || '2-10' || '2-18' => tuesday3,
        '2-3' || '2-11' || '2-19' => tuesday4,
        '2-4' || '2-12' || '2-20' => tuesday5,
        '2-5' || '2-13' || '2-21' => tuesday6,
        '2-6' || '2-14' || '2-22' => tuesday7,
        '2-7' || '2-15' || '2-23' => tuesday8,
        // Wed
        '3-0' || '3-8' || '3-16' => wednesday1,
        '3-1' || '3-9' || '3-17' => wednesday2,
        '3-2' || '3-10' || '3-18' => wednesday3,
        '3-3' || '3-11' || '3-19' => wednesday4,
        '3-4' || '3-12' || '3-20' => wednesday5,
        '3-5' || '3-13' || '3-21' => wednesday6,
        '3-6' || '3-14' || '3-22' => wednesday7,
        '3-7' || '3-15' || '3-23' => wednesday8,
        // Thursday
        '4-0' || '4-8' || '4-16' => thursday1,
        '4-1' || '4-9' || '4-17' => thursday2,
        '4-2' || '4-10' || '4-18' => thursday3,
        '4-3' || '4-11' || '4-19' => thursday4,
        '4-4' || '4-12' || '4-20' => thursday5,
        '4-5' || '4-13' || '4-21' => thursday6,
        '4-6' || '4-14' || '4-22' => thursday7,
        '4-7' || '4-15' || '4-23' => thursday8,
        // Friday
        '5-0' || '5-8' || '5-16' => friday1,
        '5-1' || '5-9' || '5-17' => friday2,
        '5-2' || '5-10' || '5-18' => friday3,
        '5-3' || '5-11' || '5-19' => friday4,
        '5-4' || '5-12' || '5-20' => friday5,
        '5-5' || '5-13' || '5-21' => friday6,
        '5-6' || '5-14' || '5-22' => friday7,
        '5-7' || '5-15' || '5-23' => friday8,
        // Saturday
        '6-0' || '6-8' || '6-16' => saturday1,
        '6-1' || '6-9' || '6-17' => saturday2,
        '6-2' || '6-10' || '6-18' => saturday3,
        '6-3' || '6-11' || '6-19' => saturday4,
        '6-4' || '6-12' || '6-20' => saturday5,
        '6-5' || '6-13' || '6-21' => saturday6,
        '6-6' || '6-14' || '6-22' => saturday7,
        '6-7' || '6-15' || '6-23' => saturday8,
        // Sunday
        '7-0' || '7-8' || '7-16' => [],
        '7-1' || '7-9' || '7-17' => [],
        '7-2' || '7-10' || '7-18' => [],
        '7-3' || '7-11' || '7-19' => [],
        '7-4' || '7-12' || '7-20' => [],
        '7-5' || '7-13' || '7-21' => [],
        '7-6' || '7-14' || '7-22' => [],
        '7-7' || '7-15' || '7-23' => [],
        String() => throw UnimplementedError('colonyActionPointsInfo $caKey'),
      };
}

final monday1 = [CATask.buildingPower, CATask.enhancementPower];
final monday2 = [
  CATask.evolutionPower,
  CATask.speedupEvolving,
  CATask.consumeBioEssence,
  CATask.consumeSpecialHypha,
  CATask.consumeHypha,
  ...CATask.consumeFungusList
];
final monday3 = [CATask.buildingPower, CATask.enhancementPower];
final monday4 = [
  CATask.speedupAny,
  CATask.consumeBioEssence,
  CATask.consumeSpecialHypha,
  CATask.consumeHypha,
  ...CATask.consumeFungusList,
];
final monday5 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.enhancementPower
];
final monday6 = [
  CATask.buildingPower,
  CATask.speedupBuilding,
  CATask.consumeBioEssence,
  CATask.consumeSpecialHypha,
  CATask.consumeHypha,
  ...CATask.consumeFungusList,
  CATask.speedupBuildingEnhancement
];
final monday7 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.enhancementPower,
  ...CATask.hatchSoldierAntsList,
];
final monday8 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.enhancementPower,
  ...CATask.hatchSoldierAntsList,
  CATask.consumeBioEssence,
  CATask.consumeSpecialHypha,
  CATask.consumeHypha,
  ...CATask.consumeFungusList,
];

final tuesday1 = [
  CATask.buildingPower,
  CATask.speedupBuilding,
  CATask.enhancementPower,
  CATask.speedupBuildingEnhancement
];
final tuesday2 = [
  CATask.buildingPower,
  CATask.consumeBioEssence,
  CATask.enhancementPower,
  ...CATask.obtainCellList,
  ...CATask.consumeCellList,
  ...CATask.consumeCellFluidList,
];
final tuesday3 = [
  CATask.speedupHatchingSoldiers,
];
final tuesday4 = [
  CATask.buildingPower,
  CATask.enhancementPower,
  ...CATask.hatchSoldierAntsList,
  CATask.consumeBioEssence,
  ...CATask.obtainCellList,
  ...CATask.consumeCellList,
  ...CATask.consumeCellFluidList,
];
final tuesday5 = [
  CATask.speedupHatchingSoldiers,
  CATask.speedupEvolving,
  CATask.speedupBuilding,
];
final tuesday6 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.speedupHatchingSoldiers,
  CATask.consumeBioEssence,
  ...CATask.obtainCellList,
  ...CATask.consumeCellList,
  ...CATask.consumeCellFluidList,
  CATask.enhancementPower,
];
final tuesday7 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  ...CATask.hatchSoldierAntsList,
  CATask.enhancementPower,
];
final tuesday8 = [
  CATask.buildingPower,
  CATask.consumeBioEssence,
  ...CATask.obtainCellList,
  ...CATask.consumeCellList,
  ...CATask.consumeCellFluidList,
  CATask.enhancementPower,
];

final wednesday1 = [
  CATask.buildingPower,
  CATask.speedupBuilding,
  CATask.enhancementPower,
  CATask.speedupBuildingEnhancement
];
final wednesday2 = [
  CATask.evolutionPower,
  CATask.speedupEvolving,
  CATask.consumeCreatureRemain
];
final wednesday3 = [CATask.speedupHatchingSoldiers];
final wednesday4 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.consumeCreatureRemain,
  CATask.enhancementPower
];
final wednesday5 = [
  CATask.buildingPower,
  ...CATask.hatchSoldierAntsList,
  CATask.enhancementPower
];
final wednesday6 = [
  CATask.speedupHatchingSoldiers,
  CATask.speedupEvolving,
  CATask.speedupBuilding,
  CATask.consumeCreatureRemain,
];
final wednesday7 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.speedupHatchingSoldiers,
  CATask.enhancementPower,
];
final wednesday8 = [
  CATask.speedupHatchingSoldiers,
  CATask.speedupEvolving,
  CATask.speedupBuilding,
  CATask.consumeCreatureRemain
];

final thursday1 = [
  CATask.buildingPower,
  CATask.speedupBuilding,
  CATask.enhancementPower,
  CATask.speedupBuildingEnhancement,
];
final thursday2 = [
  CATask.consumeSpore,
  CATask.redeemSpore,
  ...CATask.consumeEggs,
  CATask.unlockSpecialAntSkill,
  CATask.specialAntExperience,
  ...CATask.starUpSpecialAntsList,
];
final thursday3 = [
  CATask.speedupHatchingSoldiers,
  CATask.speedupEvolving,
  CATask.speedupBuilding,
];
final thursday4 = [
  CATask.consumeSpore,
  CATask.redeemSpore,
  ...CATask.consumeEggs,
  CATask.unlockSpecialAntSkill,
  CATask.specialAntExperience,
  ...CATask.starUpSpecialAntsList,
];
final thursday5 = [CATask.speedupAny];
final thursday6 = [
  CATask.consumeSpore,
  CATask.redeemSpore,
  ...CATask.consumeEggs,
  CATask.unlockSpecialAntSkill,
  CATask.specialAntExperience,
  ...CATask.starUpSpecialAntsList,
];
final thursday7 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.speedupHatchingSoldiers,
  CATask.enhancementPower,
];
final thursday8 = [
  CATask.consumeSpore,
  CATask.redeemSpore,
  ...CATask.consumeEggs,
  CATask.unlockSpecialAntSkill,
  CATask.specialAntExperience,
  ...CATask.starUpSpecialAntsList,
];

final friday1 = [CATask.speedupAny];
final friday2 = [
  CATask.speedupHatchingSoldiers,
  CATask.speedupEvolving,
  CATask.speedupBuilding,
  CATask.consumeBioEssence,
  ...CATask.obtainGeneList,
  ...CATask.consumeGeneList,
  ...CATask.consumeGeneticFactorList,
];
final friday3 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.speedupHatchingSoldiers,
  CATask.enhancementPower,
];
final friday4 = [
  CATask.speedupHatchingSoldiers,
  CATask.consumeBioEssence,
  ...CATask.obtainGeneList,
  ...CATask.consumeGeneList,
  ...CATask.consumeGeneticFactorList,
];
final friday5 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.speedupHatchingSoldiers,
  CATask.enhancementPower,
];
final friday6 = [
  CATask.buildingPower,
  ...CATask.hatchSoldierAntsList,
  CATask.consumeBioEssence,
  ...CATask.obtainGeneList,
  ...CATask.consumeGeneList,
  ...CATask.consumeGeneticFactorList,
  CATask.enhancementPower,
];
final friday7 = [
  CATask.evolutionPower,
  ...CATask.hatchSoldierAntsList,
];
final friday8 = [
  CATask.speedupAny,
  CATask.consumeBioEssence,
  ...CATask.obtainGeneList,
  ...CATask.consumeGeneList,
  ...CATask.consumeGeneticFactorList,
];

final saturday1 = [CATask.speedupAny];
final saturday2 = [
  CATask.evolutionPower,
  CATask.speedupEvolving,
  CATask.consumeBioEssence,
  ...CATask.obtainGermList,
  ...CATask.consumeGermList,
  ...CATask.consumeGermMediumList,
];
final saturday3 = [
  CATask.buildingPower,
  CATask.speedupBuilding,
  CATask.enhancementPower,
  CATask.speedupBuildingEnhancement,
];
final saturday4 = [
  CATask.speedupHatchingSoldiers,
  CATask.consumeBioEssence,
  ...CATask.obtainGermList,
  ...CATask.consumeGermList,
  ...CATask.consumeGermMediumList,
];
final saturday5 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.speedupHatchingSoldiers,
  CATask.enhancementPower,
];
final saturday6 = [
  CATask.buildingPower,
  CATask.evolutionPower,
  CATask.speedupHatchingSoldiers,
  CATask.consumeBioEssence,
  ...CATask.obtainGermList,
  ...CATask.consumeGermList,
  ...CATask.consumeGermMediumList,
  CATask.enhancementPower,
];
final saturday7 = [
  CATask.buildingPower,
  CATask.enhancementPower,
  ...CATask.hatchSoldierAntsList,
];
final saturday8 = [
  CATask.evolutionPower,
  ...CATask.hatchSoldierAntsList,
  CATask.consumeBioEssence,
  ...CATask.obtainGermList,
  ...CATask.consumeGermList,
  ...CATask.consumeGermMediumList,
];

final sunday1 = [];
final sunday2 = [];
final sunday3 = [];
final sunday4 = [];
final sunday5 = [];
final sunday6 = [];
final sunday7 = [];
final sunday8 = [];
