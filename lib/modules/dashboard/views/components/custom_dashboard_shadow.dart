
import 'package:flutter/material.dart';

class CustomDashboardShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..maskFilter =
          const MaskFilter.blur(BlurStyle.normal, 25); // Add blur to shadow

    Path shadowPath = Path();
    shadowPath.lineTo(0, size.height - 60); // Start from bottom-left
    shadowPath.quadraticBezierTo(
      size.width / 2, // Control point x
      size.height + 40, // Control point y (below the bottom edge)
      size.width, // End point x
      size.height - 60, // End point y
    );
    shadowPath.lineTo(size.width, 0); // Move to top-right
    shadowPath.close(); // Close the path

    canvas.drawPath(shadowPath, paint); // Draw the shadow
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
