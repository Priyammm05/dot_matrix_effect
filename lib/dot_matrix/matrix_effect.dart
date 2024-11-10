// The main widget for the dot effect
import 'dart:math';

import 'package:dot_matrix_effect/dot_matrix/dot.dart';
import 'package:dot_matrix_effect/dot_matrix/dot_painter.dart';
import 'package:flutter/material.dart';

class MatrixEffect extends StatefulWidget {
  const MatrixEffect({super.key});

  @override
  State<MatrixEffect> createState() => _MatrixEffectState();
}

class _MatrixEffectState extends State<MatrixEffect>
    with SingleTickerProviderStateMixin {
  // Controller for animation timing
  late AnimationController _controller;

  // List to hold all the dots in our grid
  List<Dot> dots = [];

  // Track where user is touching (-1000 means off-screen)
  Offset touchLocation = const Offset(-1000, -1000);

  // Visual settings for the effect
  static const double dotSize = 2.0; // Size of each dot
  static const double dotSpacing = 15; // Space between dots
  static const double touchBoundingSize = 70; // How far touch affects dots
  static const double dotInertia = 0.19; // How "heavy" dots feel

  // Keep track of screen size for dot grid
  Size? containerSize;

  @override
  void initState() {
    super.initState();
    // Set up animation loop (60fps)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    )
      ..addListener(() {
        updateDots();
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Create grid of dots based on screen size
  void initializeDots(Size size) {
    containerSize = size;
    int rows = (size.height / dotSpacing).floor();
    int columns = (size.width / dotSpacing).floor();

    dots = [];
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        double x = column * dotSpacing;
        double y = row * dotSpacing;
        dots.add(Dot(
          x: x,
          y: y,
          originX: x, // Remember starting position
          originY: y,
        ));
      }
    }
  }

  // Update dot positions each frame
  void updateDots() {
    const touchBoundingSizeSquared = touchBoundingSize * touchBoundingSize;

    for (var dot in dots) {
      // 1. Calculate distance from finger to dot
      double dx = touchLocation.dx - dot.x;
      double dy = touchLocation.dy - dot.y;
      double distanceSquared = dx * dx + dy * dy;

      // 2. If finger is close enough, push dot away
      if (distanceSquared < touchBoundingSizeSquared) {
        double distance = sqrt(distanceSquared);
        double force = (touchBoundingSize - distance) / touchBoundingSize;
        double angle = atan2(dy, dx);

        // Calculate where dot should move
        double targetX = dot.x - cos(angle) * force * 20;
        double targetY = dot.y - sin(angle) * force * 20;

        // Add to dot's velocity
        dot.vx += (targetX - dot.x) * dotInertia;
        dot.vy += (targetY - dot.y) * dotInertia;
      }

      // 3. Apply friction to slow dot down
      dot.vx *= 0.9;
      dot.vy *= 0.9;

      // 4. Move dot based on its velocity
      dot.x += dot.vx;
      dot.y += dot.vy;

      // 5. Pull dot back to its home position
      double dx2 = dot.originX - dot.x;
      double dy2 = dot.originY - dot.y;
      double distance2Squared = dx2 * dx2 + dy2 * dy2;

      if (distance2Squared > 1) {
        dot.x += dx2 * 0.03; // Spring force
        dot.y += dy2 * 0.03;
      }
    }
    setState(() {}); // Tell Flutter to redraw
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        // Track finger movement
        onPanStart: (details) {
          touchLocation = details.localPosition;
        },
        onPanUpdate: (details) {
          touchLocation = details.localPosition;
        },
        onPanEnd: (_) {
          touchLocation = const Offset(-1000, -1000); // Move touch off-screen
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Create dots if screen size changes
            if (containerSize == null) {
              initializeDots(Size(constraints.maxWidth, constraints.maxHeight));
            }
            return CustomPaint(
              painter: DotPainter(dots: dots, dotSize: dotSize),
              size: Size(constraints.maxWidth, constraints.maxHeight),
            );
          },
        ),
      ),
    );
  }
}
