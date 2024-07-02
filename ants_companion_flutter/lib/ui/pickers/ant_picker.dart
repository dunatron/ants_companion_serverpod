import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/ui/inputs/select_one_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AntPicker extends StatelessWidget {
  AntPicker({
    super.key,
    required this.onChange,
    this.selected,
  });

  final Ant? selected;
  final Function(Ant? ant) onChange;

  final Ants _ants = GetIt.I<Ants>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _ants.antsList(),
      builder: (context, snapshot) {
        final data = snapshot.data;

        // if (data == null) {
        //   return Text('Loading ants');
        // }
        return SelectOneDropdown<Ant>(
          labelText: 'Ant',
          items: data ?? [],
          selected: selected,
          onSelectionChanged: onChange,
          displayItem: (v) => v.name,
          validator: (value) {
            if (value == null) {
              return 'Please select an Ant';
            }
            return null;
          },
        );
      },
    );
  }
}
