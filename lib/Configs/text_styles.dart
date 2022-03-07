import 'package:flutter/cupertino.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:get/get.dart';

class AppStyles {
  static TextStyle titleStyle({
    Color color = AppColors.textColor,
    double height = 1.5,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: height,
    );
  }

  static TextStyle subTitleStyle({
    Color color = AppColors.textSubtitle,
    double height = 1.5,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: height,
    );
  }

  static TextStyle priceStyle({
    Color color = AppColors.buttonColor,
    double height = 1.5,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: height,
    );
  }

  static TextStyle hintStyle({
    Color color = AppColors.hintColor,
  }) {
    return TextStyle(
      color: Get.isDarkMode ? AppColors.textSubtitle : color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.03,
    );
  }

  static TextStyle errorTextStyle() {
    return TextStyle(
      color: AppColors.error,
      fontSize: 14,
      letterSpacing: 0.03,
      height: 0.8,
    );
  }

  static BoxShadow boxShadow() {
    return BoxShadow(
      color: AppColors.inputBorderColor.withOpacity(Get.isDarkMode ? 0.05 : 0.15),
      blurRadius: 4,
      spreadRadius: 4,
    );
  }
}
