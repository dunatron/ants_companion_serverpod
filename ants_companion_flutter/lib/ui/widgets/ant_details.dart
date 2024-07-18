import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/ui/widgets/add_card.dart';
import 'package:ants_companion_flutter/ui/widgets/ant_profile_image.dart';
import 'package:flutter/material.dart';

class AntDetails extends StatelessWidget {
  const AntDetails({super.key, required this.ant});

  final Ant ant;

  @override
  Widget build(BuildContext context) {
    final profilePictureUrl = ant.profilePictureUrl;
    return Column(
      children: [
        Text(
          ant.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (profilePictureUrl != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: AntProfileImage(src: profilePictureUrl, radius: 120),
          ),
        Text(
          ant.type.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24),
        Text(ant.description),
        const AdCard()
      ],
    );
  }
}
