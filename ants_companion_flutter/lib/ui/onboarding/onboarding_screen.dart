import 'package:ants_companion_flutter/ui/onboarding/examples/with_builder.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: WithPages());
    return WithBuilder();
  }
}
