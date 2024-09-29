import 'package:flower_animation/components/main_flower_animations.dart';
import 'package:flutter/material.dart';

class FlowerPage extends StatelessWidget {
  const FlowerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: const AnimatedFlower(),
      ),
    );
  }
}
