import 'package:flutter/material.dart';

class AntsAppBar extends StatelessWidget {
  const AntsAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // title: Text(title),
      floating: true,
      snap: true,
      title: _TitleWithBackButton(title: title),

      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.cabin),
      ),
    );
  }
}

class _TitleWithBackButton extends StatelessWidget {
  const _TitleWithBackButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    return Row(
      children: [
        if (canPop)
          IconButton(
            onPressed: () {
              // Scaffold.of(context).openDrawer();
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
        Text(title),
      ],
    );
  }
}
