import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/domain/tier_tags/models/tier_rating.dart';
import 'package:ants_companion_flutter/ui/widgets/ant_profile_image.dart';
import 'package:flutter/material.dart';

class AntTierIndicator extends StatelessWidget {
  const AntTierIndicator({
    super.key,
    required this.ant,
    required this.tierRating,
    this.onTap,
  });

  final Ant ant;
  final TierRating tierRating;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: tierRating.color,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(58),
      ),
      child: AntProfileImage(
        onTap: onTap,
        src: ant.profilePictureUrl ?? '',
        radius: 40,
      ),
    );
  }
}
