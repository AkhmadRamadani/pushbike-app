import 'package:flutter/material.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class CustomDashboardEllipsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorConst.textColour50 // Color of the ellipse
      ..style = PaintingStyle.fill
      ..maskFilter =
          const MaskFilter.blur(BlurStyle.normal, 8); // Apply blur effect

    // Draw the ellipse
    final rect = Rect.fromLTWH(
        0, 0, size.width, size.height); // Define the rectangle bounds
    canvas.drawOval(rect, paint); // Draw the oval inside the bounds
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // No need to repaint if nothing changes
  }
}
