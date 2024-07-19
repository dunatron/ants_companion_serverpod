import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Navigator',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Admin'),
            onTap: () {
              Navigator.pop(context);
              context.go('/admin');
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Onboarding'),
            onTap: () {
              Navigator.pop(context);
              context.go('/onboarding');
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Tier Ratings'),
            onTap: () {
              Navigator.pop(context);
              context.go('/tier-ratings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Ants tier list'),
            onTap: () {
              context.go('/pve-tier-list');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Battle Simulator'),
            onTap: () {
              context.go('/battle-simulator');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Hatch Recorder'),
            onTap: () {
              context.go('/hatch-recorder');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('CSV Manager'),
            onTap: () {
              context.go('/csv-manager');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('CA Reminders'),
            onTap: () {
              context.go('/csv-manager');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
