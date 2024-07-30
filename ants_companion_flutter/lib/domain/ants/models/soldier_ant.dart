enum SoldierType { guardian, shooter, carrier }

/// base_attack = attack * soldier_count
///
/// e.g base_attack =  136 * 339600 = 46185600
///
/// https://www.youtube.com/watch?v=3Xh7mjK_XcA
///
/// lathy sniffer 100% chance to release 200% +(level *1)
/// skill_release = 46185600+0.20% = 46277971.2;
///
/// Below is just a bad hunch
/// skill_damage = skill_release * (76 + 50)

// ignore: slash_for_doc_comments
/**
 * What nonsense is egnai spewing
 * - It will take 14 defense to counter 1 attack'
 * - it will take 6.5 health to counter 1 attack
 */

class SoldierAnt {
  SoldierAnt({
    required this.type,
    required this.attack,
    required this.defense,
    required this.health,
    required this.power,
    required this.marchSpeed,
    required this.load,
    this.meatCost = 0,
    this.plantCost = 0,
  });

  SoldierType type;

  int attack;
  int defense;
  int health;

  double power;
  int marchSpeed;
  int load;
  double meatCost;
  double plantCost;

  int get actualHealth => health * 10;

  // static double calculateDamage(double baseDamage, double defense, double k) {
  //   return baseDamage * (1 - defense / (defense + k));
  // }

  static double calculateDamage(
    double baseDamage,
    int attack,
    int defense,
  ) {
    return baseDamage + ((attack * attack) / (attack + defense));
  }

  static double lostPerNormalAttack(SoldierAnt s1, SoldierAnt s2) {
    // Calculate damage as the attack value of s1 minus the defense value of s2
    // int damage = s1.attack - s2.defense;

    double damage = calculateDamage(5, s1.attack, s1.defense);

    // Ensure damage is not negative
    if (damage < 0) {
      damage = 0;
    }

    // Calculate how many ants are lost
    // double antsLost = damage / s2.health;

    double antsLost = damage / s2.actualHealth;

    return antsLost;
  }

  static Map<int, SoldierAnt> get guardians => {
        1: guardianT1,
        2: guardianT2,
        3: guardianT3,
        4: guardianT4,
        5: guardianT5,
        6: guardianT6,
        7: guardianT7,
        8: guardianT8,
        9: guardianT9,
        10: guardianT10,
      };

  static Map<int, SoldierAnt> get shooters => {
        1: shooterT1,
        2: shooterT2,
        3: shooterT3,
        4: shooterT4,
        5: shooterT5,
        6: shooterT6,
        7: shooterT7,
        8: shooterT8,
        9: shooterT9,
        10: shooterT10,
      };

  static Map<int, SoldierAnt> get carriers => {
        1: carrierT1,
        2: carrierT2,
        3: carrierT3,
        4: carrierT4,
        5: carrierT5,
        6: carrierT6,
        7: carrierT7,
        8: carrierT8,
        9: carrierT9,
        10: carrierT10,
      };

  static SoldierAnt get guardianT1 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 9,
        defense: 11,
        health: 4,
        power: 1.0,
        marchSpeed: 15,
        load: 15,
        meatCost: 0,
      );

  static SoldierAnt get guardianT2 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 13,
        defense: 15,
        health: 5,
        power: 1.4,
        marchSpeed: 15,
        load: 15,
        meatCost: 0,
      );

  static SoldierAnt get guardianT3 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 18,
        defense: 20,
        health: 7,
        power: 1.9,
        marchSpeed: 14,
        load: 14,
        meatCost: 0.04,
      );

  static SoldierAnt get guardianT4 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 23,
        defense: 27,
        health: 8,
        power: 2.5,
        marchSpeed: 14,
        load: 13,
        meatCost: 0.04,
      );

  static SoldierAnt get guardianT5 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 32,
        defense: 33,
        health: 10,
        power: 3.2,
        marchSpeed: 13,
        load: 12,
        meatCost: 0.04,
      );

  static SoldierAnt get guardianT6 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 38,
        defense: 44,
        health: 13,
        power: 4.0,
        marchSpeed: 13,
        load: 11,
        meatCost: 0.04,
      );

  static SoldierAnt get guardianT7 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 46,
        defense: 53,
        health: 15,
        power: 4.9,
        marchSpeed: 12,
        load: 10,
        meatCost: 0.08,
      );

  static SoldierAnt get guardianT8 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 49,
        defense: 61,
        health: 17,
        power: 5.9,
        marchSpeed: 12,
        load: 10,
        meatCost: 0.08,
      );

  static SoldierAnt get guardianT9 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 70,
        defense: 73,
        health: 20,
        power: 7.0,
        marchSpeed: 11,
        load: 9,
        meatCost: 0.12,
      );

  static SoldierAnt get guardianT10 => SoldierAnt(
        type: SoldierType.guardian,
        attack: 77,
        defense: 90,
        health: 25,
        power: 8.2,
        marchSpeed: 10,
        load: 9,
        meatCost: 0.12,
      );

  static SoldierAnt get shooterT1 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 15,
        defense: 6,
        health: 3,
        power: 1.0,
        marchSpeed: 15,
        load: 15,
        meatCost: 0.04,
      );

  static SoldierAnt get shooterT2 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 21,
        defense: 9,
        health: 3,
        power: 1.4,
        marchSpeed: 15,
        load: 15,
        meatCost: 0.04,
      );

  static SoldierAnt get shooterT3 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 28,
        defense: 13,
        health: 4,
        power: 1.9,
        marchSpeed: 14,
        load: 14,
        meatCost: 0.04,
      );

  static SoldierAnt get shooterT4 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 37,
        defense: 17,
        health: 5,
        power: 2.5,
        marchSpeed: 14,
        load: 13,
        meatCost: 0.04,
      );

  static SoldierAnt get shooterT5 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 48,
        defense: 20,
        health: 7,
        power: 3.2,
        marchSpeed: 13,
        load: 12,
        meatCost: 0.04,
      );

  static SoldierAnt get shooterT6 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 60,
        defense: 26,
        health: 8,
        power: 4.0,
        marchSpeed: 13,
        load: 11,
        meatCost: 0.04,
      );

  static SoldierAnt get shooterT7 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 73,
        defense: 34,
        health: 10,
        power: 4.9,
        marchSpeed: 12,
        load: 10,
        meatCost: 0.08,
      );

  static SoldierAnt get shooterT8 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 89,
        defense: 38,
        health: 12,
        power: 5.9,
        marchSpeed: 12,
        load: 10,
        meatCost: 0.08,
      );

  static SoldierAnt get shooterT9 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 105,
        defense: 49,
        health: 13,
        power: 7.0,
        marchSpeed: 11,
        load: 9,
        meatCost: 0.12,
      );

  static SoldierAnt get shooterT10 => SoldierAnt(
        type: SoldierType.shooter,
        attack: 124,
        defense: 53,
        health: 17,
        power: 8.2,
        marchSpeed: 10,
        load: 9,
        meatCost: 0.12,
      );

  static SoldierAnt get carrierT1 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 11,
        defense: 8,
        health: 4,
        power: 1.0,
        marchSpeed: 18,
        load: 15,
        plantCost: 0.04,
      );

  static SoldierAnt get carrierT2 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 16,
        defense: 11,
        health: 4,
        power: 1.4,
        marchSpeed: 18,
        load: 15,
        plantCost: 0.04,
      );

  static SoldierAnt get carrierT3 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 21,
        defense: 15,
        health: 6,
        power: 1.9,
        marchSpeed: 17,
        load: 14,
        plantCost: 0.04,
      );

  static SoldierAnt get carrierT4 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 31,
        defense: 17,
        health: 7,
        power: 2.5,
        marchSpeed: 17,
        load: 13,
        plantCost: 0.04,
      );

  static SoldierAnt get carrierT5 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 40,
        defense: 22,
        health: 9,
        power: 3.2,
        marchSpeed: 16,
        load: 12,
        plantCost: 0.04,
      );

  static SoldierAnt get carrierT6 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 46,
        defense: 32,
        health: 11,
        power: 4.0,
        marchSpeed: 16,
        load: 11,
        plantCost: 0.04,
      );

  static SoldierAnt get carrierT7 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 61,
        defense: 34,
        health: 13,
        power: 4.9,
        marchSpeed: 15,
        load: 10,
        plantCost: 0.08,
      );

  static SoldierAnt get carrierT8 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 67,
        defense: 47,
        health: 15,
        power: 5.9,
        marchSpeed: 15,
        load: 10,
        plantCost: 0.08,
      );

  static SoldierAnt get carrierT9 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 87,
        defense: 49,
        health: 18,
        power: 7.0,
        marchSpeed: 14,
        load: 9,
        plantCost: 0.12,
      );

  static SoldierAnt get carrierT10 => SoldierAnt(
        type: SoldierType.carrier,
        attack: 94,
        defense: 65,
        health: 21,
        power: 8.2,
        marchSpeed: 13,
        load: 9,
        plantCost: 0.12,
      );
}
