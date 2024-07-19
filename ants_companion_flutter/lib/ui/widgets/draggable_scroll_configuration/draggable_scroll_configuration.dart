import 'package:ants_companion_flutter/ui/draggable_scroll_configuration.dart';
import 'package:flutter/material.dart';

class DraggableScrollConfiguration extends StatelessWidget {
  const DraggableScrollConfiguration({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: DraggableScrollBehavior(),
        child: child,
      );
}
