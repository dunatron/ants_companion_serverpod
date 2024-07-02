import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/ui/ants_carousel/ants_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AllAntsCarousel extends StatelessWidget {
  const AllAntsCarousel({
    super.key,
    this.onItemImageTap,
  });

  final Function(Ant ant)? onItemImageTap;

  @override
  Widget build(BuildContext context) {
    final Ants ants = GetIt.I<Ants>();
    return StreamBuilder(
      stream: ants.antsList(),
      builder: (context, snapshot) {
        return AntsCarousel(
          id: 'all-ants-carousel',
          onCardImageTap: onItemImageTap,
          ants: snapshot.data ?? [],
          loading: snapshot.connectionState == ConnectionState.waiting,
          error: snapshot.error,
        );
      },
    );
  }
}
