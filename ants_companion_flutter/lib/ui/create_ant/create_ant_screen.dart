import 'package:ants_companion_flutter/ui/create_ant/create_ant_form.dart';
import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:flutter/material.dart';

class CreateAntScreen extends StatelessWidget {
  const CreateAntScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Create Ant',
      slivers: [
        SliverToBoxAdapter(
          child: CreateAntForm(),
        ),
        // SliverToBoxAdapter(
        //   child: LayoutBuilder(
        //     builder: (context, constraints) {
        //       return Center(
        //         child: Container(
        //           width: constraints.maxWidth > 650.0
        //               ? 650.0
        //               : constraints.maxWidth,
        //           color: Colors.blue,
        //           padding: EdgeInsets.all(16.0),
        //           child: Text(
        //             'This is a container with a maximum width of 200 pixels.',
        //             style: TextStyle(color: Colors.white),
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
