import 'package:ants_companion_flutter/ui/draggable_scroll_configuration.dart';
import 'package:ants_companion_flutter/ui/widgets/app_drawer.dart';
import 'package:ants_companion_flutter/ui/widgets/ants_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({
    super.key,
    required this.title,
    required this.slivers,
    this.controller,
    this.onRefresh,
    this.floatingActionButton,
  });

  final String title;
  final List<Widget> slivers;

  final ScrollController? controller;

  final Future<void> Function()? onRefresh;

  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    Widget content = CustomScrollView(
      controller: controller,
      slivers: [
        AntsAppBar(title: title),
        if (onRefresh != null)
          CupertinoSliverRefreshControl(onRefresh: onRefresh),
        ...slivers,
      ],
    );

    if (onRefresh != null) {
      content = RefreshIndicator(
        onRefresh: onRefresh!,
        child: content,
      );
    }

    return Scaffold(
      drawer: const AppDrawer(),
      body: content,
      floatingActionButton: floatingActionButton,
    );
  }
}
