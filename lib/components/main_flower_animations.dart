import 'package:flower_animation/components/flower_components/leaves.dart';
import 'package:flower_animation/components/flower_components/main_branch.dart';
import 'package:flower_animation/components/flower_components/petals.dart';
import 'package:flutter/material.dart';

class AnimatedFlower extends StatefulWidget {
  const AnimatedFlower({Key? key}) : super(key: key);

  @override
  State<AnimatedFlower> createState() => _AnimatedFlowerState();
}

class _AnimatedFlowerState extends State<AnimatedFlower>
    with SingleTickerProviderStateMixin {
  final petalsSize = const Size(300, 300);
  late AnimationController _controller;
  late Animation<double> _maiBranchAnimation;
  late Animation<double> _petalsAnimation;
  late Animation<double> _leaf1Animation;
  late Animation<double> _leaf2Animation;
  late Animation<double> _leaf3Animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _maiBranchAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 50),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 50),
    ]).animate(_controller);
    _petalsAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(-1.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 50),
    ]).animate(_controller);
    _leaf1Animation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(-1.0), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 35),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 40),
    ]).animate(_controller);
    _leaf2Animation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(-1.0), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 40),
    ]).animate(_controller);
    _leaf3Animation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(-1.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 30),
    ]).animate(_controller);
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                  left: width * .33,
                  child: CustomPaint(
                      size: petalsSize,
                      painter: PetalsPainter(context,
                          progress: _petalsAnimation.value))),
              Positioned(
                  top: height * .65,
                  left: width * .34,
                  child: CustomPaint(
                      size: Size(100, 100),
                      painter: LeafPainter(context,
                          progress: _leaf1Animation.value))),
              Positioned(
                  top: height * .6,
                  left: width * .67,
                  child: CustomPaint(
                      size: Size(80, 80),
                      painter: LeafPainter(context,
                          progress: _leaf2Animation.value, isFlipped: true))),
              Positioned(
                  top: height * .5,
                  left: width * .57,
                  child: CustomPaint(
                      size: Size(50, 50),
                      painter: LeafPainter(context,
                          progress: _leaf3Animation.value))),
              Positioned(
                  top: petalsSize.height,
                  child: CustomPaint(
                      size: Size(width, height - petalsSize.height),
                      painter: MainBranchPainter(context,
                          progress: _maiBranchAnimation.value))),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: StatefulBuilder(builder: (context, setInnerState) {
                    return FloatingActionButton(
                      onPressed: () {
                        if (_controller.isAnimating) {
                          _controller.stop();
                        } else {
                          if (_controller.isCompleted) _controller.reset();
                          _controller.forward();
                        }
                        setState(() {});
                      },
                      child: Icon(_controller.isAnimating
                          ? Icons.stop
                          : Icons.play_arrow),
                    );
                  }))
            ],
          );
        });
  }
}
