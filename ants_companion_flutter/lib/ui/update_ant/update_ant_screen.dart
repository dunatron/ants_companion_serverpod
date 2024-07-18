import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:ants_companion_flutter/ui/update_ant/update_ant_form.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UpdateAntScreen extends StatefulWidget {
  const UpdateAntScreen({
    super.key,
    required this.antId,
  });

  final String antId;

  @override
  State<UpdateAntScreen> createState() => _UpdateAntScreenState();
}

class _UpdateAntScreenState extends State<UpdateAntScreen> {
  final Ants _ants = GetIt.I();
  Ant? ant;
  String? error;

  @override
  void initState() {
    super.initState();
    _fetchAnt();
  }

  Future<void> _fetchAnt() async {
    try {
      final fetchedAnt = await _ants.antById(widget.antId);
      setState(() {
        ant = fetchedAnt;
        error = null;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Update ${ant?.name ?? ''}',
      slivers: [
        if (error != null)
          SliverToBoxAdapter(
            child: Text('Something went wrong getting the ant:\n$error'),
          )
        else if (ant == null)
          const SliverToBoxAdapter(child: CircularProgressIndicator())
        else
          SliverToBoxAdapter(child: UpdateAntForm(ant: ant!)),
      ],
    );
  }
}
