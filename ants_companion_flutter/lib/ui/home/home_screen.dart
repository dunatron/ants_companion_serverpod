import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/ui/ant_details/ant_details_screen.dart';
import 'package:ants_companion_flutter/ui/ants_carousel/all_ants_carousel.dart';
import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Ants _ants = GetIt.I<Ants>();

  _continueToTierRatingsScreen(BuildContext context) {
    context.go('/tier-ratings');
  }

  // _continueToAntDetails(final String antId, BuildContext context) {
  //   context.go('/ant/$antId');
  // }

  _launchAntDetails(final Ant ant, BuildContext context) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        showDragHandle: true,
        builder: (BuildContext _) {
          return DraggableScrollableSheet(
            maxChildSize: 0.8,
            initialChildSize: kIsWeb ? 0.8 : 0.5,
            expand: false,
            builder: (
              BuildContext context,
              ScrollController scrollController,
            ) =>
                AntDetailsScreen(scrollController: scrollController),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Home',
      onRefresh: () async {
        await _ants.refresh();
      },
      slivers: [
        const SliverToBoxAdapter(
          child: Text('Home Screen SLiver section'),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: () {
                    _continueToTierRatingsScreen(context);
                  },
                  child: const Text('Tier Ratings Screen'),
                ),
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: AllAntsCarousel(
            onItemImageTap: (final ant) => _launchAntDetails(ant, context),
          ),
        ),
        SliverList.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Index: $index'),
            );
          },
        ),
      ],
    );
  }
}
