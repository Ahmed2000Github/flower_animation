import 'dart:ui';

import 'package:flower_animation/utils/app_configs.dart';
import 'package:flutter/material.dart';

class MainBranchPainter extends CustomPainter {
  final BuildContext context;
  final double progress;

  MainBranchPainter(this.context, {this.progress = 1});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = AppConfigs.getPaint(context);

    final path = Path();
    final startPointHeight = size.height - 20;
    final startPointWidth = size.width / 5;
    final endPointHeight = 0.0;
    final endPointWidth = size.width * 4 / 6 + 12;
    path.moveTo(startPointWidth, startPointHeight);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 3 / 4, endPointWidth, endPointHeight);
      AppConfigs.animatePath(canvas, paint, path, progress);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
