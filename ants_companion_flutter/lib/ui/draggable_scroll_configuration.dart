import 'dart:ui';

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

class DraggableScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.unknown,
      };
  // @override
  // Set<PointerDeviceKind> get dragDevices => {
  //       PointerDeviceKind.touch,
  //       PointerDeviceKind.mouse,
  //       PointerDeviceKind.trackpad,
  //     };
}
