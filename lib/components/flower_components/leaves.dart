import 'dart:math';

import 'package:flower_animation/utils/app_configs.dart';
import 'package:flutter/material.dart';

class LeafPainter extends CustomPainter {
  final BuildContext context;
  final bool isFlipped;
  final double progress;

  LeafPainter(this.context, {this.progress = 1, this.isFlipped = false});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = AppConfigs.getPaint(context);

    final path = Path();
    final startPointHeight = size.height;
    final startPointWidth = size.width;
    final breakPointHeight = size.height * .7;
    final breakPointWidth = size.width * 0.7;
    path.moveTo(startPointWidth, startPointHeight);
    path.quadraticBezierTo(
        size.width, size.height * 0.85, breakPointWidth, breakPointHeight);
    path.cubicTo(0, size.height * .9, size.width / 8, size.height / 6, 0, 0);

    if (isFlipped) {
      canvas.translate(size.width / 2, size.height / 2);
      canvas.rotate(pi / 19);
      canvas.scale(-1, 1);
      canvas.translate(-size.width / 2, -size.height / 2);
    }
    AppConfigs.animatePath(canvas, paint, path, progress);
    final startProgressAt = .3;
    if (progress >= startProgressAt) {
      final secondPath = Path();
      secondPath.moveTo(breakPointWidth, breakPointHeight);
      secondPath.cubicTo(
          size.height * .9, 0, size.width / 8, size.height / 6, 0, 0);
      final adjusedProgress =
          (progress - startProgressAt) / (1 - startProgressAt);
      AppConfigs.animatePath(canvas, paint, secondPath, adjusedProgress);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
