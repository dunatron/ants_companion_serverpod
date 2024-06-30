import 'dart:ui';

import 'package:ants_companion_flutter/ui/draggable_scroll_configuration.dart';
import 'package:flutter/material.dart';

final defaultColorFilter =
    ColorFilter.mode(Colors.black.withOpacity(0.65), BlendMode.darken);

class CarouselSlide {
  CarouselSlide({
    required this.heroTag,
    this.imageUrl,
    this.child,
  });

  final String? imageUrl;
  final String heroTag;
  final Widget? child;
}

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    super.key,
    required this.id,
    required this.height,
    this.pageController,
    required this.slides,
    this.viewportFraction,
    this.initialPage,
    this.onItemTap,
    this.useFilter,
    this.colorFilter,
    this.pageSnapping = true,
    this.padEnds = true,
  });

  final double height;
  final PageController? pageController;
  final List<CarouselSlide> slides;
  final double? viewportFraction;
  final int? initialPage;
  final bool? useFilter;
  final ColorFilter? colorFilter;
  final bool pageSnapping;
  final String id;
  final bool padEnds;
  final Function(int index)? onItemTap;

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late PageController _pageController;
  var _activePage = 0;
  late PageStorageKey<String> _pageStorageKey;

  @override
  void initState() {
    super.initState();
    _activePage = widget.initialPage ?? 0;
    // _pageController = PageController(
    //   viewportFraction: widget.viewportFraction ?? 0.8,
    //   initialPage: _activePage,
    // );
    _pageController = widget.pageController ??
        PageController(
          viewportFraction: widget.viewportFraction ?? 0.8,
          initialPage: _activePage,
        );
    _pageStorageKey = PageStorageKey(widget.id);
  }

  void goToIndex(final int pageIndex) => _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

  @override
  Widget build(BuildContext context) {
    ColorFilter? _filter =
        widget.useFilter == true || widget.colorFilter != null
            ? widget.colorFilter ?? defaultColorFilter
            : null;

    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: DraggableScrollConfiguration(
        child: PageView.builder(
          key: _pageStorageKey,
          itemCount: widget.slides.length,
          pageSnapping: widget.pageSnapping,
          controller: _pageController,
          padEnds: widget.padEnds,
          onPageChanged: (pageNumber) {
            setState(() {
              _activePage = pageNumber;
            });
          },
          itemBuilder: (context, pagePosition) {
            return slider(
              slide: widget.slides[pagePosition],
              pagePosition: pagePosition,
              active: pagePosition == _activePage,
              colorFilter: _filter,
              onTap: () {
                widget.onItemTap?.call(pagePosition);
              },
            );
          },
        ),
      ),
    );
  }

  GestureDetector slider({
    required CarouselSlide slide,
    required int pagePosition,
    required bool active,
    ColorFilter? colorFilter,
    VoidCallback? onTap,
  }) {
    final isFirstItem = pagePosition == 0;
    final isLastItem = pagePosition == widget.slides.length - 1;

    // First and last items are a bit smaller, as a result of the added padding
    final padding = isFirstItem
        ? const EdgeInsets.only(left: 16, right: 6)
        : isLastItem
            ? const EdgeInsets.only(left: 6, right: 16)
            : const EdgeInsets.symmetric(horizontal: 6);
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: slide.heroTag,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          padding: padding,
          child: Stack(
            children: [
              slide.child ?? Container(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
