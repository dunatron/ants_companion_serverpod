import 'package:ants_companion_flutter/domain/models/ant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AntCard extends StatelessWidget {
  const AntCard({super.key, this.onImageTap});

  final Function()? onImageTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ElevatedButton(
          onPressed: onImageTap,
          child: Text('Image Tap'),
        )
      ],
    ));
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
