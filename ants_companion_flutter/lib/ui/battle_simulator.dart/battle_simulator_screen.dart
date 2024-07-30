import 'package:ants_companion_flutter/domain/ants/models/soldier_ant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BattleTeam {
  BattleTeam({
    required this.frontSoldiers,
    required this.middleSoldiers,
    required this.backSoldiers,
  });

  SoldierAnt frontSoldiers;
  SoldierAnt middleSoldiers;
  SoldierAnt backSoldiers;
}

class BattleSimulatorScreen extends StatefulWidget {
  const BattleSimulatorScreen({super.key});

  @override
  State<BattleSimulatorScreen> createState() => _BattleSimulatorScreenState();
}

class _BattleSimulatorScreenState extends State<BattleSimulatorScreen> {
  final team1 = BattleTeam(
    frontSoldiers: SoldierAnt.carrierT9,
    middleSoldiers: SoldierAnt.guardianT1,
    backSoldiers: SoldierAnt.shooterT9,
  );

  final team2 = BattleTeam(
    frontSoldiers: SoldierAnt.carrierT9,
    middleSoldiers: SoldierAnt.guardianT1,
    backSoldiers: SoldierAnt.shooterT9,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battle Sim'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
