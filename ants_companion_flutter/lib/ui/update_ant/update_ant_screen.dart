import 'package:ants_companion_flutter/domain/ants/ants.dart';
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

  String? antName;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Update $antName',
      slivers: [
        FutureBuilder(
          future: _ants.antById(widget.antId),
          builder: (context, snapshot) {
            final ant = snapshot.data;
            final error = snapshot.error;

            if (error != null) {
              return SliverToBoxAdapter(
                child: Text('Something went wrong getting the ant:\n$error'),
              );
            }

            if (ant == null) {
              return const SliverToBoxAdapter(
                child: CircularProgressIndicator(),
              );
            }

            return SliverToBoxAdapter(
              child: UpdateAntForm(ant: ant),
            );
          },
        ),
      ],
    );
  }
}
