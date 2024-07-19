import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/ant_tier_tag.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/lineup_position.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';
import 'package:ants_companion_flutter/ui/widgets/tier_display/ant_tier_indicator.dart';
import 'package:flutter/material.dart';

class TierSection extends StatelessWidget {
  const TierSection({
    super.key,
    required this.ants,
    required this.antType,
    required this.tierRating,
    required this.isPvp,
    required this.tierTags,
  });

  final TierRating tierRating;
  final AntType antType;

  final List<Ant> ants;

  final List<AntTierTag> tierTags;

  final bool isPvp;

  // void _onIndicatorTap(final Ant ant) => AlertDialog(
  //       content: Card(
  //         child: Text(ant.name),
  //       ),
  //     );

  void _showAntModal(
    BuildContext context,
    Ant ant,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return DraggableScrollableSheet(
          builder: (context, scrollController) {
            return Placeholder();
            // return AntDetailsPage(ant: ant);
          },
        );
      },
    );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Dialog(
    //         child: Card(
    //       child: Text(ant.name),
    //     ));
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    List<Ant> frontRow = [];
    List<Ant> middleRow = [];
    List<Ant> backRow = [];

    for (var tag in tierTags) {
      if (tag.rating == tierRating) {
        if (tag.lineupPosition == LineupPosition.front) {
          final ant = ants.firstWhere((it) => it.id == tag.antId);
          frontRow.add(ant);
        } else if (tag.lineupPosition == LineupPosition.middle) {
          final ant = ants.firstWhere((it) => it.id == tag.antId);
          frontRow.add(ant);
        } else if (tag.lineupPosition == LineupPosition.back) {
          final ant = ants.firstWhere((it) => it.id == tag.antId);
          frontRow.add(ant);
        }
      }
      // for (var tag in ant.tierTags) {
      //   final isPvpTag = tag is AntPvpTierTag;

      //   final isCorrectTagType = isPvpTag == isPvp;

      //   final valid = tag.rating == tierRating &&
      //       tag.antType == antType &&
      //       isCorrectTagType;
      //   // final valid = tag.rating == tierRating &&
      //   //     (tag.antType == antType || tag.antType == AntType.universal) &&
      //   //     isCorrectTagType;
      //   if (tag.rowPosition == RowPosition.front && valid) {
      //     frontRow.add(ant);
      //   } else if (tag.rowPosition == RowPosition.middle && valid) {
      //     middleRow.add(ant);
      //   } else if (tag.rowPosition == RowPosition.back && valid) {
      //     backRow.add(ant);
      //   }
      // }
    }

    // for (var ant in ants) {
    //   // for (var tag in ant.tierTags) {
    //   //   final isPvpTag = tag is AntPvpTierTag;

    //   //   final isCorrectTagType = isPvpTag == isPvp;

    //   //   final valid = tag.rating == tierRating &&
    //   //       tag.antType == antType &&
    //   //       isCorrectTagType;
    //   //   // final valid = tag.rating == tierRating &&
    //   //   //     (tag.antType == antType || tag.antType == AntType.universal) &&
    //   //   //     isCorrectTagType;
    //   //   if (tag.rowPosition == RowPosition.front && valid) {
    //   //     frontRow.add(ant);
    //   //   } else if (tag.rowPosition == RowPosition.middle && valid) {
    //   //     middleRow.add(ant);
    //   //   } else if (tag.rowPosition == RowPosition.back && valid) {
    //   //     backRow.add(ant);
    //   //   }
    //   // }
    // }

    if (frontRow.isEmpty && middleRow.isEmpty && backRow.isEmpty) {
      return const SizedBox();
    }

    return Container(
      // color: tierRating.color,
      margin: const EdgeInsets.only(bottom: 64),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            tierRating.displayText,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: tierRating.color),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Front'),
                    const SizedBox(height: 16),
                    // ...frontRow.map((ant) => Chip(label: Text(ant.name)))
                    ...frontRow.map((ant) => AntTierIndicator(
                          ant: ant,
                          onTap: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                expand: false,
                                initialChildSize: 0.8,
                                maxChildSize: 0.9,
                                minChildSize: 0.8,
                                builder: (context, scrollController) {
                                  // return SingleChildScrollView(
                                  //   controller: scrollController,
                                  //   child: AntDetailsPage(ant: ant),
                                  // );

                                  return Placeholder();
                                },
                              );
                            },
                          ),
                          // onTap: () => _showAntModal(
                          //   context,
                          //   ant,
                          // ),
                          tierRating: tierRating,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Middle'),
                    const SizedBox(height: 16),
                    ...middleRow.map((ant) => AntTierIndicator(
                          ant: ant,
                          // onTap: () => _showAntModal(
                          //   context,
                          //   ant,
                          // ),
                          onTap: () => showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => DraggableScrollableSheet(
                              initialChildSize: 1,
                              maxChildSize: 1,
                              minChildSize: 1,
                              builder: (context, scrollController) =>
                                  SingleChildScrollView(
                                controller: scrollController,
                                child: Column(
                                  children: [
                                    Container(
                                      color: Colors.purple,
                                      height: 100,
                                    ),
                                    Container(
                                      color: Colors.orange,
                                      height: 300,
                                    ),
                                    Container(
                                      color: Colors.black,
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          tierRating: tierRating,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Back'),
                    const SizedBox(height: 16),
                    ...backRow.map((ant) => AntTierIndicator(
                          ant: ant,
                          onTap: () => _showAntModal(
                            context,
                            ant,
                          ),
                          tierRating: tierRating,
                        ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
