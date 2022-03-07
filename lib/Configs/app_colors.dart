import 'package:flutter/material.dart';
import 'package:get/get.dart';

// AppColors class contains all the colors for the application
class AppColors {
  final bool darkMode;
  AppColors(this.darkMode);
  // Light Theme Colors
  static const Color buttonColor = Color(0xFFFD7272); // Main color of the app
  static const Color white = Color(0xFFFFFFFF); // White color
  static const Color textColor = Color(0xFF000000); // Black text color, for Titles
  static const Color textSubtitle = Color(0xFF737373); // Subtitle color
  static const Color hintColor = Color(0xFFB5B5B5);
  static const Color inputBorderColor = Color(0xFF737373); // Border color
  static const Color primary = Color(0xFFF9F9F9);
  static const Color error = Color(0xFFD94F4F);
  static const Color popup = Color(0xFF08B43D);

  //Dart theme colors
  static const Color textColorD = Color(0xFFE9E9E9);
  static const Color textSubtitleD = Color(0xFF737373);
  static const Color primaryD = Color(0xFF222222);

// Get Theme Color based on system preferences

  static Color getModeColor(BuildContext context, [Color? color1, Color? color2]) {
    if (Get.isDarkMode) {
      return color1 ?? Colors.white;
    } else {
      return color2 ?? textColor;
    }
  }
}
