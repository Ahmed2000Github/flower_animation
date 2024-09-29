import 'package:flower_animation/utils/app_configs.dart';
import 'package:flutter/material.dart';

class PetalsPainter extends CustomPainter {
  final BuildContext context;
  final double progress;

  PetalsPainter(this.context, {this.progress = 1});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = AppConfigs.getPaint(context);
    final path = Path();
    final startPointHeight = size.height;
    final startPointWidth = size.width / 2;
    path.moveTo(startPointWidth, startPointHeight);
    path.quadraticBezierTo(
        0, size.height * .8, size.width * .8, size.height * .3);
    path.moveTo(startPointWidth, startPointHeight);
    path.cubicTo(size.width, size.height, size.width * .6, size.height * .4,
        size.width * .8, size.height * .3);
    path.moveTo(startPointWidth, startPointHeight);
    path.quadraticBezierTo(size.width * .1, size.height * .85, startPointWidth,
        size.height * .515);
    path.quadraticBezierTo(
        size.width * .4, size.height * .4, size.width * .2, size.height * .3);
    path.moveTo(startPointWidth, startPointHeight);
    path.cubicTo(0, size.height, size.width * .4, size.height * .4,
        size.width * .2, size.height * .3);

    AppConfigs.animatePath(canvas, paint, path, progress);
    final startProgressAt = .8;
    if (progress >= startProgressAt) {
      final mainPath = Path();
      mainPath.moveTo(size.width * .4, size.height * .42);
      mainPath.quadraticBezierTo(size.width * .4, size.height * .36,
          startPointWidth, size.height * .3);
      mainPath.moveTo(size.width * .6, size.height * .42);
      mainPath.quadraticBezierTo(size.width * .6, size.height * .36,
          startPointWidth, size.height * .3);
      final adjusedProgress =
          (progress - startProgressAt) / (1 - startProgressAt);
      AppConfigs.animatePath(canvas, paint, mainPath, adjusedProgress);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
