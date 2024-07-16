import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/domain/tier_tags/tier_tags.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ants_companion_flutter/ui/widgets/ant_profile_image.dart';

class AntCard extends StatelessWidget {
  const AntCard({
    super.key,
    required this.ant,
    this.onImageTap,
    this.actions,
  });

  final Ant ant;

  final Widget? actions;

  final Function()? onImageTap;

  /// ToDo: extract to on the card
  void _showTierTagsModal(
    BuildContext context,
    Ant ant,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(child: Card(child: Text('ToDo')));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _actions = actions;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    ant.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                if (_actions != null) _actions,
              ],
            ),

            const SizedBox(height: 8),
            _buildProfileRow(context, ant),
            const SizedBox(height: 8),
            // Expanded(child: Container()),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () => _showTierTagsModal(context, ant),
                  child: _tierRatingsRow(context, ant),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildProfileRow(BuildContext context, Ant ant) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onImageTap,
          child: AntProfileImage(src: ant.profilePictureUrl ?? ''),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ant.role.name,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              ant.type.name,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        )
      ],
    );
  }

  Row _tierRatingsRow(BuildContext context, Ant ant) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'PVE',
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.end,
            ),
            Text(
              // ant.topPveRating().displayText,
              'F',
              // style: Theme.of(context)
              //     .textTheme
              //     .headlineSmall
              //     ?.copyWith(color: ant.topPveRating().color),
              textAlign: TextAlign.center,
            )
          ],
        ),
        const SizedBox(width: 16),
        AntTierTags(antId: ant.id)
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       'PVP',
        //       style: Theme.of(context).textTheme.labelSmall,
        //       textAlign: TextAlign.end,
        //     ),
        //     Text('F'
        //         // ant.topPvpRating().displayText,
        //         // style: Theme.of(context)
        //         //     .textTheme
        //         //     .headlineSmall
        //         //     ?.copyWith(color: ant.topPvpRating().color),
        //         )
        //   ],
        // )
      ],
    );
  }
}

class AntTierTags extends StatelessWidget {
  AntTierTags({
    super.key,
    required this.antId,
  });

  final String antId;

  final TierTags _tierTags = GetIt.I<TierTags>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _tierTags.tierTagsForAnt(antId),
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data == null) {
          return const CircularProgressIndicator();
        }

        return Text(data.map((e) => e.rating).join(', '));
      },
    );
  }
}

// class AntCard extends StatelessWidget {
//   const AntCard({super.key, required this.ant, this.onImageTap});

//   final Ant ant;

//   final Function()? onImageTap;

//   void _showTierTagsModal(
//     BuildContext context,
//     Ant ant,
//   ) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(child: AntTierTagReasons(ant: ant));
//       },
//     );
//   }

//   _continueToAntDetails(BuildContext context) {
//     context.go('/ant/${ant.id}');
//   }

//   // _onImageTap() {
//   //   if(onTap)
//   //   // context.go('/ant/${ant.id}');
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               ant.name,
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             const SizedBox(height: 8),
//             _buildProfileRow(context),
//             const SizedBox(height: 8),
//             Expanded(child: Container()),
//             Row(
//               children: [
//                 const Expanded(child: SizedBox()),
//                 InkWell(
//                   onTap: () => _showTierTagsModal(context, ant),
//                   child: _tierRatingsRow(context),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Row _buildProfileRow(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GestureDetector(
//           // onTap: _onImageTap,
//           onTap: onImageTap,
//           // onTap: () {
//           //   context.go('/ant/${ant.id}');
//           // },
//           child: ProfileImage(imagePath: ant.profilePath),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               ant.role.name,
//               style: Theme.of(context).textTheme.labelSmall,
//             ),
//             Text(
//               ant.type.name,
//               style: Theme.of(context).textTheme.labelSmall,
//             ),
//           ],
//         )
//       ],
//     );
//   }

//   Row _tierRatingsRow(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//               'PVE',
//               style: Theme.of(context).textTheme.labelSmall,
//               textAlign: TextAlign.end,
//             ),
//             Text(
//               ant.topPveRating().displayText,
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall
//                   ?.copyWith(color: ant.topPveRating().color),
//               textAlign: TextAlign.center,
//             )
//           ],
//         ),
//         const SizedBox(width: 16),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'PVP',
//               style: Theme.of(context).textTheme.labelSmall,
//               textAlign: TextAlign.end,
//             ),
//             Text(
//               ant.topPvpRating().displayText,
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall
//                   ?.copyWith(color: ant.topPvpRating().color),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
