import 'package:flutter/cupertino.dart';
import 'package:products_task/Configs/app_colors.dart';

class AppStyles {
  static TextStyle titleStyle({
    Color color = AppColors.textBlack,
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
    Color color = AppColors.primary,
    double height = 1.5,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: height,
    );
  }
}
