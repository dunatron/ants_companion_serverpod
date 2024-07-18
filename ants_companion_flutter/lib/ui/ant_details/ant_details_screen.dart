// import 'package:flutter/material.dart';

// class AntDetailsScreen extends StatefulWidget {
//   const AntDetailsScreen({super.key, required this.scrollController});

//   final ScrollController scrollController;

//   @override
//   State<AntDetailsScreen> createState() => _AntDetailsScreenState();
// }

// class _AntDetailsScreenState extends State<AntDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       controller: widget.scrollController,
//       slivers: [
//         SliverList.builder(
//           itemCount: 100,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text('Index: $index'),
//             );
//           },
//         )
//       ],
//     );
//     ;
//   }
// }

import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/ui/widgets/ant_details.dart';
import 'package:flutter/material.dart';

class AntDetailsScreen extends StatelessWidget {
  const AntDetailsScreen({
    super.key,
    required this.scrollController,
    required this.ant,
  });

  final Ant ant;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: AntDetails(ant: ant),
        ),
        // SliverList.builder(
        //   itemCount: 100,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text('Index: $index'),
        //     );
        //   },
        // )
      ],
    );
  }
}
