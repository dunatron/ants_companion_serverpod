import 'package:flutter/material.dart';

class SliverGenericGrid<T> extends StatelessWidget {
  const SliverGenericGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.gridDelegate = defaultGridDelegate,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  final SliverGridDelegate gridDelegate;

  final Widget Function(T item, int index) itemBuilder;

  final List<T> items;

  final EdgeInsets padding;

  static const defaultGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    childAspectRatio: 8 / 5,
  );

  @override
  Widget build(final BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: gridDelegate,
        delegate: SliverChildBuilderDelegate(
          (final context, final index) => itemBuilder(items[index], index),
          childCount: items.length,
        ),
      ),
    );
  }
}
