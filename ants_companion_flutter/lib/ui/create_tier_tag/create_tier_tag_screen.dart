import 'package:ants_companion_flutter/ui/create_tier_tag/create_tier_tag_form.dart';
import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:flutter/material.dart';

class CreateTierTagScreen extends StatelessWidget {
  const CreateTierTagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Create Tier Tag',
      slivers: [
        SliverToBoxAdapter(
          child: CreateTierTagForm(),
        )
      ],
    );
  }
}
