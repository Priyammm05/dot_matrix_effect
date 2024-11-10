// Custom painter to draw all dots
import 'package:dot_matrix_effect/dot_matrix/dot.dart';
import 'package:flutter/material.dart';

class DotPainter extends CustomPainter {
  final List<Dot> dots;
  final double dotSize;

  DotPainter({required this.dots, required this.dotSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw each dot as a circle
    for (var dot in dots) {
      canvas.drawCircle(
        Offset(dot.x, dot.y),
        dotSize / 2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DotPainter oldDelegate) {
    return true; // Always repaint to show animation
  }
}
