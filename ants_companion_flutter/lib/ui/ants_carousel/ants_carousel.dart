import 'dart:ui';

import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/ui/ant_card/ant_card.dart';
import 'package:ants_companion_flutter/ui/draggable_scroll_configuration.dart';
import 'package:ants_companion_flutter/ui/spacing.dart';
import 'package:ants_companion_flutter/ui/widgets/carousel.dart';
import 'package:flutter/material.dart';

class AntsCarousel extends StatefulWidget {
  const AntsCarousel({
    super.key,
    required this.id,
    required this.ants,
    this.onCardImageTap,
    this.loading = false,
    this.error,
  });

  final String id;
  final List<Ant> ants;
  final bool loading;
  final Object? error;

  final Function(Ant ant)? onCardImageTap;

  @override
  State<AntsCarousel> createState() => _AntsCarouselState();
}

class _AntsCarouselState extends State<AntsCarousel>
    with WidgetsBindingObserver {
  late PageController _pageController;
  late double _viewportFraction;

  void goToIndex(final int pageIndex) => _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _viewportFraction = 0.8;
    _initializePageController();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => afterFirstLayout(context));
    super.initState();
  }

  // @override
  // void didChangeMetrics() {
  //   // setState(() {
  //   //   // This will force a rebuild when a window size change is detected
  //   // });
  //   final size = View.of(context).physicalSize;
  //   afterFirstLayout(context);
  //   print('didChangeDependencies size width: ${size.width}');
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // [View.of] exposes the view from `WidgetsBinding.instance.platformDispatcher.views`
    // into which this widget is drawn.
    // final size = View.of(context).physicalSize;
    afterFirstLayout(context);
    // print('didChangeDependencies size width: ${size.width}');
    // _lastSize = size
  }

  void afterFirstLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardsThatFit = screenWidth / 300;
    final viewportFraction = 1 / cardsThatFit;

    final newViewportFraction = viewportFraction;

    if (_viewportFraction != newViewportFraction) {
      // update new viewportFraction
      _viewportFraction = newViewportFraction;
      // Dispose the old controller
      _pageController.dispose();
      // Create a new controller with updated viewport fraction
      _initializePageController();
    }
  }

  /// Get size screen
  Size get screenSize => MediaQuery.of(context).size;

  void _initializePageController() {
    _pageController = PageController(
      viewportFraction: _viewportFraction,
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double height = 300;

    if (widget.loading) {
      return const Card(
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (widget.error != null) {
      return Card(
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: Center(
            child: Text(
              "Error loading ants carousel: \n ${widget.error.toString()}",
            ),
          ),
        ),
      );
    }

    if (widget.ants.isEmpty) {
      return const SizedBox(
        width: double.infinity,
        height: height,
        child: Center(
          child: Text("No Ants to display"),
        ),
      );
    }

    // Convert the set to a list
    List<String> sortedLetters = widget.ants.getFirstLetters().toList();

    // Sort the list alphabetically
    sortedLetters.sort();

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.fromLTRB(Spacing.l, 0, Spacing.l, Spacing.vl),
          child: DraggableScrollConfiguration(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...sortedLetters.map(
                    (letter) => GestureDetector(
                      onTap: () => goToIndex(
                        widget.ants.indexOfFirstLetterFoundOnName(letter),
                      ),
                      child: Chip(label: Text(letter)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        CarouselWidget(
          pageController: _pageController,
          key: Key(_viewportFraction.toString()),
          id: widget.id,
          height: height,
          viewportFraction: _viewportFraction,
          slides: widget.ants.map((ant) => _slide(ant)).toList(),
        ),
      ],
    );
  }

  CarouselSlide _slide(Ant ant) => CarouselSlide(
        heroTag: ant.name,
        child: AntCard(
          ant: ant,
          onImageTap: widget.onCardImageTap != null
              ? () => widget.onCardImageTap!(ant)
              : null,
        ),
      );
}

extension on List<Ant> {
  Set<String> getFirstLetters() {
    Set<String> firstLetters = <String>{};

    for (Ant item in this) {
      if (item.name.isNotEmpty) {
        firstLetters.add(item.name[0]);
      }
    }

    return firstLetters;
  }

  int indexOfFirstLetterFoundOnName(String letter) {
    for (int i = 0; i < length; i++) {
      if (this[i].name.isNotEmpty &&
          this[i].name[0].toUpperCase() == letter.toUpperCase()) {
        return i;
      }
    }
    return -1;
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
