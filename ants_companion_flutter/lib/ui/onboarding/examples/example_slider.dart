import 'package:flutter/material.dart';

class ExampleSlider extends StatefulWidget {
  const ExampleSlider({super.key});

  @override
  State<ExampleSlider> createState() => _ExampleSliderState();
}

class _ExampleSliderState extends State<ExampleSlider> {
  double sliderVal = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sliderVal,
      activeColor: Colors.white,
      inactiveColor: Colors.red,
      onChanged: (val) {
        setState(() {
          sliderVal = val;
        });
      },
    );
  }
}
