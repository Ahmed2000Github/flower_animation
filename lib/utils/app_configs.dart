import 'package:flutter/material.dart';

class AppConfigs {
  static Paint getPaint(BuildContext context) {
    return Paint()
      ..color = Theme.of(context).primaryColor
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 10.0);
  }

  static animatePath(Canvas canvas, Paint paint, Path path, double progress) {
    final pathMetrics = path.computeMetrics();
    for (var pathMetric in pathMetrics) {
      var pathExtract = pathMetric.extractPath(0, pathMetric.length * progress);
      canvas.drawPath(pathExtract, paint);
    }
  }
}
