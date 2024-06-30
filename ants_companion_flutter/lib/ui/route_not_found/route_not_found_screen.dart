import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteNotFoundScreen extends StatelessWidget {
  const RouteNotFoundScreen({super.key, required this.routePath});

  final String routePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Route not found'),
            Text(routePath),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Home'),
            )
          ],
        ),
      ),
    );
  }
}
