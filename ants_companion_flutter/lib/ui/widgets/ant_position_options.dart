import 'package:ants_companion_flutter/domain/tier_tags/models/ant_tier_tag.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/lineup_position.dart';
import 'package:flutter/material.dart';

class AntPositionOptions extends StatelessWidget {
  const AntPositionOptions({
    super.key,
    this.title,
    required this.tags,
  });

  final String? title;
  final List<AntTierTag> tags;

  @override
  Widget build(BuildContext context) {
    final titleLabel = title;

    if (tags.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        if (titleLabel != null) ...[
          Text(
            titleLabel,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16)
        ],
        PvpPositionsDisplay(
          pvpOptions: tags,
        ),
      ],
    );
  }
}

class PvpPositionsDisplay extends StatelessWidget {
  const PvpPositionsDisplay({super.key, required this.pvpOptions});

  final List<AntTierTag> pvpOptions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowPositionColumn(
          pvpOptions: pvpOptions,
          position: LineupPosition.front,
        ),
        RowPositionColumn(
          pvpOptions: pvpOptions,
          position: LineupPosition.middle,
        ),
        RowPositionColumn(
          pvpOptions: pvpOptions,
          position: LineupPosition.back,
        ),
      ],
    );
  }
}

class RowPositionColumn extends StatelessWidget {
  const RowPositionColumn({
    super.key,
    required this.pvpOptions,
    required this.position,
  });

  final List<AntTierTag> pvpOptions;

  final LineupPosition position;

  void _showTierTagsModal(
    BuildContext context,
    AntTierTag tag,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(tag.reason),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              position.displayText(),
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ...pvpOptions.where((it) => it.lineupPosition == position).map(
                  (it) => InkWell(
                    onTap: () => _showTierTagsModal(context, it),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            it.rating.displayText,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: it.rating.color),
                          ),
                          // Text(
                          //   it.antType.name,
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .labelMedium
                          //       ?.copyWith(color: it.rating.color),
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}

extension on LineupPosition {
  String displayText() => switch (this) {
        LineupPosition.front => 'Front',
        LineupPosition.middle => 'Middle',
        LineupPosition.back => 'Back',
      };
}
