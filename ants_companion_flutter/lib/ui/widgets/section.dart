import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      child: Column(children: children),
    );
  }
}
