import 'dart:math' as math;

import 'package:flutter/material.dart';

class Blossom extends StatelessWidget {
  const Blossom({
    super.key,
    required this.size,
    this.petalColor = const Color(0xFFF3C1C4),
    this.innerPetalColor = const Color(0xFFF7D4D6),
    this.centerColor = const Color(0xFFE7A0A8),
  });

  final double size;
  final Color petalColor;
  final Color innerPetalColor;
  final Color centerColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _BlossomPainter(
        petalColor: petalColor,
        innerPetalColor: innerPetalColor,
        centerColor: centerColor,
      ),
    );
  }
}

class _BlossomPainter extends CustomPainter {
  _BlossomPainter({
    required this.petalColor,
    required this.innerPetalColor,
    required this.centerColor,
  });

  final Color petalColor;
  final Color innerPetalColor;
  final Color centerColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    _drawPetals(
      canvas,
      center,
      size,
      color: petalColor,
      petalWidth: size.width * 0.36,
      petalHeight: size.height * 0.46,
      distance: size.height * 0.18,
      rotation: -0.4,
    );
    _drawPetals(
      canvas,
      center,
      size,
      color: innerPetalColor,
      petalWidth: size.width * 0.24,
      petalHeight: size.height * 0.30,
      distance: size.height * 0.1,
      rotation: 0.25,
    );
    canvas.drawCircle(center, size.width * 0.09, Paint()..color = centerColor);
  }

  void _drawPetals(
    Canvas canvas,
    Offset center,
    Size size, {
    required Color color,
    required double petalWidth,
    required double petalHeight,
    required double distance,
    required double rotation,
  }) {
    final paint = Paint()..color = color;
    for (var i = 0; i < 5; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(rotation + i * math.pi * 2 / 5);
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(0, -distance),
          width: petalWidth,
          height: petalHeight,
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _BlossomPainter oldDelegate) {
    return oldDelegate.petalColor != petalColor ||
        oldDelegate.innerPetalColor != innerPetalColor ||
        oldDelegate.centerColor != centerColor;
  }
}
