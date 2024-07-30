import 'dart:math' as math;
import 'package:intl/intl.dart';

import 'package:ants_companion_flutter/domain/ants/models/soldier_ant.dart';
import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:ants_companion_flutter/ui/soldier_details/soldier_card_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SoldierDetailsComparisonScreen extends StatefulWidget {
  const SoldierDetailsComparisonScreen({super.key});

  @override
  State<SoldierDetailsComparisonScreen> createState() =>
      _SoldierDetailsComparisonScreenState();
}

class _SoldierDetailsComparisonScreenState
    extends State<SoldierDetailsComparisonScreen> {
  int _selectedTier = 4;

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 2,
    );
    ;
    final tiers = List.generate(10, (index) => index + 1);

    final guard = _selectedTier.soldierAntFromTier(SoldierType.guardian);
    final shooter = _selectedTier.soldierAntFromTier(SoldierType.shooter);
    final carrier = _selectedTier.soldierAntFromTier(SoldierType.carrier);

    int ants = 339600; // Example number of ants

    // double attackBonus = 0.2; // Example attack bonus
    double attackBonus = 1372; // Example attack bonus

    double attackPower = math.sqrt(ants) * carrier.attack * (1 + attackBonus);

    return PageLayout(
      title: 'Soldier Stats',
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tiers.length,
              itemBuilder: (context, index) {
                final tier = tiers[index];
                final isSelected = _selectedTier == tier;
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTier = tier;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  child: Text(
                    tier.toString(),
                    style: TextStyle(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimary
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SoldierCardDetails(soldier: guard),
              SoldierCardDetails(soldier: shooter),
              SoldierCardDetails(soldier: carrier),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(numberFormat.format(
                  SoldierAnt.calculateDamage(5, guard.attack, guard.defense))),
              Text(
                  'guard on guard: ${SoldierAnt.lostPerNormalAttack(guard, guard).toStringAsFixed(2)}'),
              Text(
                  'guard on shooter: ${SoldierAnt.lostPerNormalAttack(guard, shooter).toStringAsFixed(2)}'),
              Text(
                  'guard on carrier: ${SoldierAnt.lostPerNormalAttack(guard, carrier).toStringAsFixed(2)}'),
              Text(
                  'shooter on guard: ${SoldierAnt.lostPerNormalAttack(shooter, guard).toStringAsFixed(2)}'),
              Text(
                  'shooter on shooter: ${SoldierAnt.lostPerNormalAttack(shooter, shooter).toStringAsFixed(2)}'),
              Text(
                  'shooter on carrier: ${SoldierAnt.lostPerNormalAttack(shooter, carrier).toStringAsFixed(2)}'),
              Text(
                  'carrier on guard: ${SoldierAnt.lostPerNormalAttack(carrier, guard).toStringAsFixed(2)}'),
              Text(
                  'carrier on shooter: ${SoldierAnt.lostPerNormalAttack(carrier, shooter).toStringAsFixed(2)}'),
              Text(
                  'carrier on carrier: ${SoldierAnt.lostPerNormalAttack(carrier, carrier).toStringAsFixed(2)}'),
              SizedBox(
                height: 60,
              ),
              Text('Damage from a squad'),
              Text(numberFormat.format(attackPower)),
            ],
          ),
        ),
      ],
    );
  }
}

// refactor this code.
// there are 3 types carrier, guardian, shooter
// and 9 tiers
// it must be able to get the correct SoldierAnt based on tier and type
extension on int {
  SoldierAnt soldierAntFromTier(SoldierType type) {
    final val = switch (type) {
      SoldierType.guardian => SoldierAnt.guardians[this],
      SoldierType.shooter => SoldierAnt.shooters[this],
      SoldierType.carrier => SoldierAnt.carriers[this],
    };

    if (val == null) {
      return SoldierAnt.guardianT1;
      // throw Exception('soldierAntFromTier is null');
    }

    return val;
  }
}
