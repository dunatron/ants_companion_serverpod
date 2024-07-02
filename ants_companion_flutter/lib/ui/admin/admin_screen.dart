import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Admin Area',
      slivers: [
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {
              context.go('/admin/create-ant');
            },
            child: const Text('Create Ant'),
          ),
        ),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {
              context.go('/admin/create-tier-tag');
            },
            child: const Text('Create Tier Tag'),
          ),
        )
      ],
    );
  }
}
