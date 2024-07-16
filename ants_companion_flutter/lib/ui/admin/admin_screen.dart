import 'package:ants_companion_flutter/ui/admin/admin_ants_list.dart';
import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  _goToCreateAntScreen(BuildContext context) {
    context.go('/admin/create-ant');
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return PageLayout(
      controller: scrollController,
      title: 'Admin Area',
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _goToCreateAntScreen(context),
        label: const Text('Add Ant'),
      ),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _goToCreateAntScreen(context),
                  child: const Text('Create Ant'),
                )
              ],
            ),
          ),
        ),
        AdminAntsList(),
        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }
}
