import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';
import 'package:ants_companion_flutter/domain/tier_tags/tier_tags.dart';
import 'package:ants_companion_flutter/ui/draggable_scroll_configuration.dart';
import 'package:ants_companion_flutter/ui/widgets/section.dart';
import 'package:ants_companion_flutter/ui/widgets/tier_display/tier_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TierDisplayWithData extends StatelessWidget {
  const TierDisplayWithData({
    super.key,
    required this.ants,
  });

  final Ants ants;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ants.antsList(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final pveList = data;

        return TierDisplay(ants: pveList);
      },
    );
  }
}

class TierDisplay extends StatefulWidget {
  const TierDisplay({super.key, required this.ants});

  final List<Ant> ants;

  @override
  State<TierDisplay> createState() => _TierDisplayState();
}

class _TierDisplayState extends State<TierDisplay> {
  AntType _antType = AntType.guardian;

  bool _isPvp = false;

  final TierTags _tierTags = GetIt.I();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: !_isPvp
                        ? MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.onPrimary,
                          )
                        : null,
                    backgroundColor: !_isPvp
                        ? MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary,
                          )
                        : null),
                onPressed: () {
                  setState(() {
                    _isPvp = false;
                  });
                },
                child: Text('PVE'),
              ),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: _isPvp
                        ? MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.onPrimary,
                          )
                        : null,
                    backgroundColor: _isPvp
                        ? MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary,
                          )
                        : null),
                onPressed: () {
                  setState(() {
                    _isPvp = true;
                  });
                },
                child: Text('PVP'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DraggableScrollConfiguration(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...AntType.values.map(
                    (antType) => (!_isPvp && antType == AntType.universal)
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  visualDensity: VisualDensity.compact,
                                  foregroundColor: antType == _antType
                                      ? MaterialStateProperty.all<Color>(
                                          Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        )
                                      : null,
                                  backgroundColor: antType == _antType
                                      ? MaterialStateProperty.all<Color>(
                                          Theme.of(context).colorScheme.primary,
                                        )
                                      : null),
                              onPressed: () {
                                setState(() {
                                  _antType = antType;
                                });
                              },
                              child: Text(
                                antType.name.toUpperCase(),
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.fontSize,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        StreamBuilder(
          stream: _tierTags.tierTags(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            return Section(
              children: [
                ...TierRating.values.map(
                  (tierRating) => TierSection(
                    antType: _antType,
                    tierRating: tierRating,
                    ants: widget.ants,
                    isPvp: _isPvp,
                    tierTags: data ?? [],
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
