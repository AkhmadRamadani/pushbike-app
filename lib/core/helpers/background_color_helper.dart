import 'package:flutter/material.dart';

class BackgroundColorHelper {
  static Color stringToPastelColor(String text,
      {int? saturation, int? lightness}) {
    final int hash = text.hashCode;
    final int hue = hash % 360;
    final HSLColor hslColor = HSLColor.fromAHSL(1.0, hue.toDouble(),
        saturation?.toDouble() ?? 0.5, lightness?.toDouble() ?? 0.5);
    return hslColor.toColor();
  }

  static Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Add the alpha channel if it's not provided
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static bool isColorDark(Color color) {
    return color.computeLuminance() < 0.5;
  }
}
