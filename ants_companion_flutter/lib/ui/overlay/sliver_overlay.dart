import 'package:flutter/material.dart';

class SliverOverlay extends PageRoute<void> {
  SliverOverlay({required this.title, required this.slivers});

  final String title;
  final List<Widget> slivers;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => '';

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    double maxWidth = MediaQuery.of(context).size.width * 0.8;

    return SafeArea(
      child: Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            color: Theme.of(context).canvasColor,
            constraints: BoxConstraints(maxWidth: maxWidth),
            margin: const EdgeInsets.all(32),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(title),
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  floating: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                ...slivers,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
