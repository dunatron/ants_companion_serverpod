import 'package:ants_companion_flutter/domain/ants/models/soldier_ant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SoldierCardDetails extends StatelessWidget {
  const SoldierCardDetails({super.key, required this.soldier});

  final SoldierAnt soldier;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Attack: ${soldier.attack}'),
          Text('Defense: ${soldier.defense}'),
          Text('Health: ${soldier.health}'),
          Text('Power: ${soldier.power}'),
        ],
      ),
    );
  }
}
